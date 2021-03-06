
#include <iostream>
#include <tinyxml2.h>
#include <sstream>
#include "svg_to_png.hpp"
#include "elements.hpp"

using namespace tinyxml2;

namespace svg {
    // Color parsing
    const std::map<std::string, color> COLORS = {
            {"black",  {0,   0,   0}},
            {"white",  {255, 255, 255}},
            {"red",    {255, 0,   0}},
            {"green",  {0,   255, 0}},
            {"blue",   {0,   0,   255}},
            {"yellow", {255, 255, 0}}
    };

    color parse_color(const std::string &str) {
        color c;
        char first_ch = str.at(0);
        if (first_ch == '#') {
            int v;
            std::stringstream ss(str.substr(1));
            ss >> std::hex >> v;
            c.red = (v >> 16);
            c.green = (v >> 8) & 0xFF;
            c.blue = v & 0xFF;
        } else {
            c = COLORS.at(str);
        }
        return c;
    }

    // Transformation parsing

    void parse_transform(shape *s, XMLElement *elem) {
        const char* p_t_attr = elem->Attribute("transform");
        if (p_t_attr == NULL)
            return; // Not defined
        point origin{0,0};
        const char* p_t_o_attr = elem->Attribute("transform-origin");
        if (p_t_o_attr != NULL) {
            std::string str = p_t_o_attr;
            std::stringstream ss(str);
            ss >> origin.x >> origin.y;
        }
        std::string attr(p_t_attr);
        for (char &c: attr) {
            if (c == '(' || c == ')' || c == ',') {
                c = ' ';
            }
        }
        std::stringstream ss(attr);
        std::string type;
        ss >> type;
        if (type == "translate") {
            int x, y;
            ss >> x >> y;
            s->translate({x, y});
        } else if (type == "scale") {
            int v;
            ss >> v;
            s->scale(origin, v);
        } else if (type == "rotate") {
            int v;
            ss >> v;
            s->rotate(origin, v);
        } else {
            std::cout << "Unrecognised transform type: " << type << std::endl;
        }
    }

    // Point list parsing
    void
    parse_points(const std::string &s, std::vector<point> &points) {
        std::stringstream ss(s);
        std::string val;
        while (std::getline(ss, val, ' ')) {
            val.at(val.find(',')) = ' ';
            std::stringstream ss2(val);
            int x, y;
            ss2 >> x >> y;
            points.push_back({x, y});
        }
    }

    // Shape parsing
    ellipse *parse_ellipse(XMLElement *elem) {
        int cx = elem->IntAttribute("cx");
        int cy = elem->IntAttribute("cy");
        int rx = elem->IntAttribute("rx");
        int ry = elem->IntAttribute("ry");
        color fill = parse_color(elem->Attribute("fill"));
        return new ellipse(fill, {cx, cy}, {rx, ry});
    }

    ellipse *parse_circle(XMLElement *elem) {
        int cx = elem->IntAttribute("cx");
        int cy = elem->IntAttribute("cy");
        int r = elem->IntAttribute("r");
        color fill = parse_color(elem->Attribute("fill"));
        return new circle(fill, {cx, cy}, {r,r});
    }

    std::vector<point> read_points(const char *str);

    polygon *parse_polygon(XMLElement *elem) {
        color fill = parse_color(elem->Attribute("fill"));

        const char* str = elem->Attribute("points");
        std::vector<point> vector = read_points(str);

        return new polygon(fill,vector);
    }

    polygon *parse_rect(XMLElement *elem) {
        color fill = parse_color(elem->Attribute("fill"));
        int x = elem->IntAttribute("x");
        int y = elem->IntAttribute("y");
        int width = elem->IntAttribute("width") - 1;
        int height = elem->IntAttribute("height") - 1;
        std::vector<point> vector;

        vector.push_back({x,y});
        vector.push_back({x+width,y});
        vector.push_back({x+width,y+height});
        vector.push_back({x,y+height});
        //vector.push_back({x,y});

        return new rect(fill,vector);
    }

    polyline *parse_polyline(XMLElement *elem){
        color fill = parse_color(elem->Attribute("stroke"));
        const char* str = elem->Attribute("points");
        std::vector<point> vector = read_points(str);

        return new polyline(fill,vector);
    }

    polyline *parse_line(XMLElement *elem){
        color fill = parse_color(elem->Attribute("stroke"));
        int x1 = elem->IntAttribute("x1");
        int y1 = elem->IntAttribute("y1");
        int x2 = elem->IntAttribute("x2");
        int y2 = elem->IntAttribute("y2");
        std::vector<point> vector;
        vector.push_back({x1,y1});
        vector.push_back({x2,y2});

        return new line(fill,vector);
    }

    std::vector<point> read_points(const char *str) {
        std::vector<point> vector;
        const char* curr;
        bool is_y_flag = false;
        int x = 0 , y = 0;

        for(curr = str; *curr != '\0';curr++){
            if (*curr == ',') is_y_flag = true;
            else if (*curr == ' '){
                vector.push_back({x,y});
                x=0;
                y=0;
                is_y_flag = false;
            }
            else if (is_y_flag) y = y * 10 + ( (int)(*curr) - 48);
            else x = x * 10 + ( (int)(*curr) - 48);
        }
        vector.push_back({x,y});
        return vector;
    }

    // TODO other parsing functions for elements

    // Loop for parsing shapes
    void parse_shapes(XMLElement *elem, std::vector<shape *> &shapes) {
        std::map<std::string, shape* > map;
        for (auto child_elem = elem->FirstChildElement();
             child_elem != NULL;
             child_elem = child_elem->NextSiblingElement()) {
            std::string type(child_elem->Name());
            shape *s;
            

            if (type == "ellipse") {
                s = parse_ellipse(child_elem);
            }else if(type == "circle"){
                s = parse_circle(child_elem);
            }else if(type == "polygon"){
                s = parse_polygon(child_elem);
            }else if(type == "rect"){
                s = parse_rect(child_elem);
            }else if(type == "polyline"){
                s = parse_polyline(child_elem);
            }else if(type == "line"){
                s = parse_line(child_elem);
            }else if(type == "g"){
                std::vector<shape *> groupshapes;
                color c = parse_color("red");
                parse_shapes(child_elem,groupshapes);
                s = new group(c,groupshapes);
            }else if(type == "use"){
                std::string id(child_elem ->Attribute("href"));
                id.erase(0,1);

                std::cout << "ID: " << id << std::endl;
                s = (map.at(id))->duplicate();
            } else{
                std::cout << "Unrecognized shape type: " << type << std::endl;
                continue;
            }

            //std::string id = elem->Attribute("id");
            if (child_elem->Attribute("id")){
                map.insert({child_elem->Attribute("id"),s});
                std::cout << "inserted shape with ID: " << child_elem->Attribute("id") << std::endl;
            }

            parse_transform(s, child_elem);
            shapes.push_back(s);

        }
    }



    // Main conversion function.
    // TODO adapt if necessary
    void svg_to_png(const std::string &svg_file, const std::string &png_file) {
        XMLDocument doc;
        XMLError r = doc.LoadFile(svg_file.c_str());
        if (r != XML_SUCCESS) {
            return;
        }
        XMLElement *elem = doc.RootElement();
        std::vector<shape *> shapes;
        parse_shapes(elem, shapes);
        int width = elem->IntAttribute("width");
        int height = elem->IntAttribute("height");
        png_image img(width, height);
        for (auto s: shapes) {
            s->draw(img);
        }
        img.save(png_file);
        for (auto s: shapes) {
            delete s;
        }
    }

}
