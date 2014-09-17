#include "ofMain.h"
#include "ofApp.h"

int main(){
    ofAppiOSWindow * window = new ofAppiOSWindow();
    window->enableRetina();
    //  window->enableDepthBuffer();
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        if(window->isRetinaEnabled()){
            ofSetupOpenGL(ofPtr<ofAppBaseWindow>(window), 2048, 1536, OF_FULLSCREEN);
        } else {
            ofSetupOpenGL(ofPtr<ofAppBaseWindow>(window), 1024, 768, OF_FULLSCREEN);
        }
    }
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        if (window->isRetinaEnabled()) {
            ofSetupOpenGL(ofPtr<ofAppBaseWindow>(window), 960, 640, OF_FULLSCREEN);
        } else {
            ofSetupOpenGL(ofPtr<ofAppBaseWindow>(window), 480, 320, OF_FULLSCREEN);
        }
    }
    
    ofApp *app = new ofApp();
    app->window = window;
    
	ofRunApp(app);
}
