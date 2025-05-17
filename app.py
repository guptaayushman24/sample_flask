from flask import Flask
import face_recognition
import cv2
app = Flask(__name__)

@app.route('/',methods=["GET"])
def loadmodel() :
    try:
        version = face_recognition.__version__
        print(version)
        return version
    except Exception as e :
        print("An exception occured")

@app.route('/cv',methods=["GET"])
def loadopencv() :
    try:
        version = cv2.__version__
        print(version)
        return version
    except Exception as e :
        print("An exception occured")
    
if (__name__=='__main__') :
    app.run(debug=True,port=5001)

