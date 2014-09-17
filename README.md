ofxPhysicsEditorBox2D
=====================

OpenFrameworks addon for loading fixtures generated by Physics Editor(https://www.codeandweb.com/physicseditor).

Features
--------
* Attach polygons and circles
* Debug draw facility of all fixtures

Dependencies
------------
* [ofxBox2d](https://github.com/vanderlin/ofxBox2d)

Output
----------------------------------

The following image shows the Physics Editor file with all the fixtures. The annotated image is concerned with the following:

* 1 - Shape name: Corresponds to a Box2D Body. May conatain many fixtures.
* 2 - Anchor Point: Thi relative position is taken into account while initing the positions of the bodies.
* 3 - Fixtures: Polygons and Circles.
* 4 - PTM Ratio: Pixel-To-Meters ratio. This addon works best with PTM = 30.
* 5 - Export Format: This addon works with Box2D Generic (PLIST).

![Input](screenshots/peInput.png)

The following screenshot was taken from iPAD Mini Retina.

![Output](screenshots/peOutput.png)

To-Do
-----
* Support for multiple bodies

About
-----
Follow me on twitter: [@hemantasapkota](https://twitter.com/laex_pearl) and don't forget to star this project.
