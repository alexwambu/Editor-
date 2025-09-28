from fastapi import FastAPI, WebSocket
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles
import subprocess
from blockchain_launcher import launch_node
from chatbot import generate_response
from ml_runner import run_ml_code

app = FastAPI()

# Serve static frontend
app.mount("/", StaticFiles(directory="app/static", html=True), name="static")

# Allow frontend API calls
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/status")
def home():
    return {"status": "running", "service": "ML Editor + Chatbot + Blockchain"}

# Blockchain endpoint
@app.post("/launch_blockchain")
def launch_blockchain():
    launch_node()
    return {"message": "Blockchain launched"}

# ML Runner
@app.post("/run_ml")
def run_ml(code: str):
    output = run_ml_code(code)
    return {"output": output}

# Chatbot (WebSocket)
@app.websocket("/chat")
async def websocket_chat(ws: WebSocket):
    await ws.accept()
    while True:
        msg = await ws.receive_text()
        response = generate_response(msg)
        await ws.send_text(response)
