//! @file elements.hpp
#ifndef __svg_elements_hpp__
#define __svg_elements_hpp__

#include "shape.hpp"


namespace svg {
    class ellipse : public shape {
    protected:
        point center;
        point radius;
    public:
        ellipse(const svg::color &fill, const point &center, const point &radius);
        void draw(png_image &img) const override;
        void translate(const point &t) override;
        void scale(const point &origin, int v) override;
        void rotate(const point &origin, int v) override;
        shape *duplicate() const override;
    };

    class circle : public ellipse {
    public:
        circle(const svg::color &fill, const point &center, const point &radius);
    };

    class polygon : public shape {
    protected:
        std::vector<point> points;
    public:
        polygon(const svg::color &fill, const std::vector<point> &points);
        ~polygon();
        void draw(png_image &img) const override;
        void translate(const point &t) override;
        void scale(const point &origin, int v) override;
        void rotate(const point &origin, int v) override;
        shape *duplicate() const override;
    };

    class rect : public polygon{
    public:
        rect(const svg::color &fill, const std::vector<point> &points);
    };

    class polyline : public shape {
    protected:
        std::vector<point> points;
    public:
        polyline(const svg::color &fill, const std::vector<point> &points);
        ~polyline();
        void draw(png_image &img) const override;
        void translate(const point &t) override;
        void scale(const point &origin, int v) override;
        void rotate(const point &origin, int v) override;
        shape *duplicate() const override;
    };

    class line : public polyline {
    public:
        line(const svg::color &fill, const std::vector<point> &points);
    };

    class group :public shape{
    protected:
        std::vector<shape *> shapes;
    public:
        group(const color &c, const std::vector<shape *> &shapes);
        ~group();
        void draw(png_image &img) const override;
        void translate(const point &t) override;
        void scale(const point &origin, int v) override;
        void rotate(const point &origin, int v) override;
        shape *duplicate() const override;
    };
}
#endif
