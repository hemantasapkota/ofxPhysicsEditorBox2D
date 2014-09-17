#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

#include "ofxBox2d.h"
#include "GB2ShapeCache.h"

class ofApp : public ofxiOSApp {
	
    public:
        void setup();
        void update();
        void draw();
        void exit();
	
        void touchDown(ofTouchEventArgs & touch);
        void touchMoved(ofTouchEventArgs & touch);
        void touchUp(ofTouchEventArgs & touch);
        void touchDoubleTap(ofTouchEventArgs & touch);
        void touchCancelled(ofTouchEventArgs & touch);

        void lostFocus();
        void gotFocus();
        void gotMemoryWarning();
        void deviceOrientationChanged(int newOrientation);
    
        ofAppiOSWindow *window;
    
    private:
        ofxBox2d box2d;
        b2Body *gameArea;
        ofImage bg;
    
        ofTrueTypeFont font;
    
    	vector    <ofPtr<ofxBox2dCircle> >	circles;		  //	default box2d circles
};


