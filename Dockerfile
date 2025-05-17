FROM animcogn/face_recognition:gpu
COPY requirements.txt requirements.txt

RUN pip3 install -r ./requirements.txt
RUN pip3 install face-recognition
COPY Flask_Sample /Flask_Sample

CMD [ "python3", "Flask_Sample/app.py" ]