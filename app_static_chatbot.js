let ws;

function connectChat() {
  ws = new WebSocket(`ws://${window.location.host}/chat`);
  ws.onmessage = (event) => {
    const log = document.getElementById("chat-log");
    log.innerHTML += `<div class='bot'>${event.data}</div>`;
  };
}

function sendMessage() {
  const input = document.getElementById("chat-input");
  const msg = input.value;
  ws.send(msg);
  const log = document.getElementById("chat-log");
  log.innerHTML += `<div class='user'>${msg}</div>`;
  input.value = "";
}

window.onload = connectChat;
