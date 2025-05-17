from flask import Flask
import face_recognition

app = Flask(__name__)

@app.route('/',methods=["GET"])
def loadmodel() :
    try:
        version = face_recognition.__version__
        print(version)
        return version
    except Exception as e :
        print("An exception occured")

if (__name__=='__main__') :
    app.run(debug=True,port=5001)

