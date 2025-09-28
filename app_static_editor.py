async function runCode() {
  const code = document.getElementById("code-editor").value;
  const res = await fetch("/run_ml", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ code })
  });
  const data = await res.json();
  document.getElementById("output").innerText = data.output;
}

async function launchBlockchain() {
  const res = await fetch("/launch_blockchain", { method: "POST" });
  const data = await res.json();
  alert(data.message);
}
