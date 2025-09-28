def run_ml_code(code: str) -> str:
    try:
        local_vars = {}
        exec(code, {}, local_vars)
        return str(local_vars) if local_vars else "Code executed successfully."
    except Exception as e:
        return f"Error: {str(e)}"
