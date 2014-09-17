#include "ofApp.h"

float ptmRatio;
float x;
string txt = "TAP TO MAKE CIRCLES";

//--------------------------------------------------------------
void ofApp::setup(){
    ofSetOrientation(OF_ORIENTATION_90_RIGHT);
    
    bg.loadImage("images/bg~ipad@2x.png");
    
    box2d.init();
	box2d.setGravity(0, 10);
	box2d.setFPS(60.0);
    
    font.loadFont("fonts/opificio.ttf", 40);
    
    //Load fixtures
    b2BodyDef bodydef;
    bodydef.type = b2_staticBody;
    gameArea = box2d.getWorld()->CreateBody(&bodydef);
    
    NSString *file = [[NSString alloc] initWithCString:"images/bgFixture.plist"
                                              encoding:NSUTF8StringEncoding];
    
    int scale = 1;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        if (window->isRetinaEnabled()) scale = 1; else scale = 0.5;
        
       [[GB2ShapeCache sharedShapeCache]
                       addShapesWithFile:file
                       screenHeight:ofGetHeight()
                       scaleFactor:1];
    }
    
    [[GB2ShapeCache sharedShapeCache] addFixturesToBody:gameArea forShapeName:@"gameArea"];
    
    ptmRatio = [[GB2ShapeCache sharedShapeCache] ptmRatio];
    x = (ofGetWidth() - bg.width) / 2;
}

//--------------------------------------------------------------
void ofApp::update(){
    box2d.update();
}

//--------------------------------------------------------------
void ofApp::draw(){
    bg.draw(x, 0);
    
    font.drawString(txt, ofGetWidth() / 2 - font.stringWidth(txt) / 2, ofGetHeight() / 2);
    
    ofPushStyle();
    for(int i=0; i<circles.size(); i++) {
		ofFill();
		ofSetHexColor(0xf6c738);
		circles[i].get()->draw();
	}
    ofPopStyle();
    
    gameArea->SetTransform(b2Vec2(x / ptmRatio, 0), 0);
    
    ofPushStyle();
    ofSetLineWidth(3);
    [[GB2ShapeCache sharedShapeCache] drawFixtures];
    ofPopStyle();
}

//--------------------------------------------------------------
void ofApp::exit(){
}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){
    float r = ofRandom(4, 20);
    circles.push_back(ofPtr<ofxBox2dCircle>(new ofxBox2dCircle));
    circles.back().get()->setPhysics(3.0, 0.53, 0.1);
    circles.back().get()->setup(box2d.getWorld(), mouseX, mouseY, r);
}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){
}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){
}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){
}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
}

//--------------------------------------------------------------
void ofApp::lostFocus(){
}

//--------------------------------------------------------------
void ofApp::gotFocus(){
}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){
}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){
}
