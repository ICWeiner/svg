#include "elements.hpp"

namespace svg {
    ellipse::ellipse(const svg::color &fill,
                     const point &center,
                     const point &radius) :
            shape(fill), center(center), radius(radius) {

    }
    void ellipse::draw(png_image &img) const {
        img.draw_ellipse(center, radius, get_color());
    }
    void ellipse::translate(const point &t) {
        center = center.translate(t);
    }
    void ellipse::scale(const point &origin, int v) {
        radius.x *= v;
        radius.y *= v;
        center = center.scale(origin,v);
    }

    void ellipse::rotate(const point &origin, int degrees) {
        center = center.rotate(origin, degrees);
    }
    shape *ellipse::duplicate() const {
        return new ellipse(get_color(), center, radius);
    }


    circle::circle(const svg::color &fill,
                     const point &center,
                     const point &radius) :
            ellipse(fill,center,radius) {

    }

    shape *circle::duplicate() const {
        return new circle(get_color(), center, radius);
    }



    polygon::polygon(const svg::color &fill,
                     const std::vector<point> &points) :
            shape(fill) , points(points) {

    }
    void polygon::draw(png_image &img) const {
        img.draw_polygon(points, get_color());
    }

    void polygon::translate(const point &t) {
        for(int i = 0 ; i < points.size(); i++){
            points.at(i).translate(t);
        }
    }
    void polygon::scale(const point &origin, int v) {
        for(int i = 0 ; i < points.size(); i++){
            points.at(i).scale(origin,v);
        }
    }

    void polygon::rotate(const point &origin, int degrees) {
        for(int i = 0 ; i < points.size(); i++){
            points.at(i).rotate(origin,degrees);
        }
    }
    shape *polygon::duplicate() const {
        return new polygon(get_color(), points);
    }



    rect::rect(const svg::color &fill,
               const std::vector<point> &points) : polygon(fill,points){

    }


}
