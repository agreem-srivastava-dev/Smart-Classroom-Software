# 🧠 Smart Classroom AI – Real‑Time Student Engagement & Monitoring System

![License](https://img.shields.io/badge/License-MIT-yellow.svg)

![Python](https://img.shields.io/badge/Python-3.8%2B-blue) ![FastAPI](https://img.shields.io/badge/FastAPI-0.95-green) ![Streamlit](https://img.shields.io/badge/Streamlit-1.25-red) ![OpenCV](https://img.shields.io/badge/OpenCV-4.8-brightgreen) ![License](https://img.shields.io/badge/License-MIT-yellow)

**Smart Classroom AI** is an end‑to‑end computer vision system that helps educators monitor student engagement, track attendance, detect mobile phone usage, and generate actionable reports – all in real time.  
Built for the **BIT Mesra Science Exhibition 2025**, it combines face recognition, gaze estimation, posture analysis, and object detection into a sleek web dashboard.

---

## ✨ Features

- **🎥 Live Classroom Analytics**  
  Real‑time face detection, recognition, and engagement scoring (0–100%).  
  Tracks eye openness, head pose, mouth movement, and posture.

- **📱 Mobile Phone Detection**  
  Uses YOLOv8 to detect phones. Raised complaints when a student uses a phone for **>10 seconds** – includes the student’s face photo and name.

- **✅ Smart Attendance**  
  Automatic attendance marking when a recognised face appears.  
  Manual attendance via dropdown (syncs with registered students).

- **📈 Engagement Dashboard**  
  Live class engagement percentage + per‑student scores.  
  Historical trend charts (Plotly) and attention heatmaps.

- **⚠️ Complaint Log**  
  Every phone‑usage violation is saved with timestamp, student name, and the captured face image.

- **📊 Reports**  
  Session summaries (JSON), attendance CSV, engagement logs, phone violation logs, and complaints CSV.

- **🔐 Secure Login**  
  Simple username/password protection (demo credentials: `admin`/`smart123`, `teacher`/`classroom`).

- **🧩 Modular Architecture**  
  FastAPI backend + Streamlit frontend, communicating via REST API. Easy to extend.

---

## 🏗️ System Architecture
┌─────────────────┐ HTTP ┌─────────────────┐
│ Streamlit │ ◄────────────► │ FastAPI │
│ Frontend │ (REST API) │ Backend │
│ (finalfrontend2)│ │ (main.py) │
└─────────────────┘ └────────┬────────┘
│
▼
┌─────────────────┐
│ SmartClassroom │
│ Core Modules │
│ • Face Mesh │
│ • Pose │
│ • YOLO Phone │
│ • DeepFace │
└─────────────────┘

- **Backend** (`main.py` + `workingsmartcclassroom.py` + `smart_classroom_core.py`):  
  Handles webcam feed, runs AI models, manages session state, saves reports.
- **Frontend** (`finalfrontend2.py`):  
  Streamlit dashboard – live stats, attendance, complaints, analytics.
- **Database (flat files)** :  
  `registered_students/` – face images for recognition.  
  `data/` – all session logs (CSV, JSON, images).

---

## 📦 Installation

### 1. Clone the repository
```bash

    git clone https://github.com/agreem-srivastava-dev/smart-classroom-software.git
    cd smart-classroom-software

    2. Create a virtual environment (recommended)
    python -m venv venv
    source venv/bin/activate      # Linux/Mac
    venv\Scripts\activate         # Windows

    3. Run Requirements.txt

    pip install -r requirements.txt

    4. Run The Software 

    Run the setup.bat file 

    All Done 
    
    4. To Login Into WebApp

    Username Admin - admin
    Password Admin - smart123 

    How Engagement Score is Calculated
    The engagement score (0–1 → mapped to 0–100% for display) is a weighted combination of:

    Eye openness (35%) – EAR (Eye Aspect Ratio) from MediaPipe landmarks.

    Head pose (30%) – pitch & yaw relative to camera.

    Posture (20%) – shoulder line angle from Pose landmarks.

    Mouth movement (15%) – MAR (Mouth Aspect Ratio).

    Threshold: >0.6 → attentive (High), 0.3–0.6 → Medium, <0.3 → Low.

    🔧 Troubleshooting

    ❌ Webcam not opening
    On Windows, the code tries cv2.CAP_DSHOW; fallback to default.

    Try changing camera index in workingsmartcclassroom.py to 0 or 1.

    ❌ YOLO / DeepFace models not downloading
    Ensure internet connection.

    Manually download yolov8n.pt into models/ from Ultralytics.

    ❌ TypeError: 'numpy.bool_' object is not iterable
    Fixed by convert_numpy_types() in main.py → already included.

    ❌ Engagement score always 0%
    Check lighting and that the face is fully visible.

    Enable debug prints inside analyze_engagement() in smart_classroom_core.py.

    ❌ Streamlit cannot connect to backend
    Make sure backend is running on http://localhost:8000.

    Change API_URL in finalfrontend2.py if needed.


    📈 Future Enhancements

    🔗 Real‑time video streaming to browser (WebRTC / WebSocket).

    🗃️ Database (SQLite/PostgreSQL) instead of CSV files.

    📧 Automatic email/SMS alerts for phone complaints.

    🤖 Predictive analytics for student drop‑risk.

    📱 Mobile teacher app (Flutter).

    👥 Contributors

    Agreem Srivastava – Core AI & backend development.

    Project supervised by BIT Mesra, Computer Science & Engineering Department.

    📜 License
    This project is licensed under the MIT License – see the LICENSE file for details.

    🙏 Acknowledgements
    MediaPipe – Face Mesh & Pose.

    Ultralytics YOLOv8 – Phone detection.

    DeepFace – Face recognition.

    Streamlit & FastAPI – Web frameworks.

    📧 Contact
    For questions or collaboration, please open an issue on GitHub or contact:
    Agreem Srivastava – agreemsrivastava.developer@gmail.com


