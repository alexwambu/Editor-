import subprocess

def launch_node():
    # Example: Launch geth with RPC enabled
    subprocess.Popen([
        "./geth",
        "--http",
        "--http.addr", "0.0.0.0",
        "--http.port", "8545",
        "--http.api", "eth,net,web3,personal,miner",
        "--networkid", "999",
    ])
