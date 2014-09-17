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

Usage
-----
* Init Box2D
  ```
  box2d.init();
	box2d.setGravity(0, 10);
	box2d.setFPS(60.0);
  ```
* Create a Body
  ```
  b2BodyDef bodydef;
  bodydef.type = b2_staticBody; //could be static, dynamic or kinematic
  gameArea = box2d.getWorld()->CreateBody(&bodydef);
  ```
* Load fixture file
  ```
  NSString *file = [[NSString alloc] initWithCString:"images/bgFixture.plist"
                                              encoding:NSUTF8StringEncoding];
  [[GB2ShapeCache sharedShapeCache]
                  addShapesWithFile:file       //the file exported by Physics Editor
                  screenHeight:ofGetHeight()  //With defaut anchor point, we need to flip the y-coordinate  
                  scaleFactor:1];            //Scale Factor: 
                                            //       1 means the normal size as designed on the editor
                                           //        < 1 means the fixtures are shrunk
                                          //         > 1 means the fixtures are enlarged
                       
  [[GB2ShapeCache sharedShapeCache] 
                  addFixturesToBody:gameArea 
                  forShapeName:@"gameArea"];
  ```
* Debug Draw Fixtures
  ```
  void ofApp::draw() {
      ofPushStyle();
      ofSetLineWidth(3);
      [[GB2ShapeCache sharedShapeCache] drawFixtures];
      ofPopStyle();
  }
  ```

See [Example](examples/) for more details.

To-Do
-----
* Support for multiple bodies

About
-----
Follow me on twitter: [@hemantasapkota](https://twitter.com/laex_pearl) and don't forget to star this project.
