def generate_response(message: str) -> str:
    # Simple rules chatbot
    if "blockchain" in message.lower():
        return "This is your blockchain launcher chatbot. Use /launch_blockchain to start."
    elif "ml" in message.lower():
        return "You can run ML code with /run_ml."
    else:
        return f"AI: I received '{message}'."
