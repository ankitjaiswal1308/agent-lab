"""
test_tool_calling.py -- prove the local model can do TOOL CALLING.

This runs a minimal agent loop against your LOCAL Ollama service:

    user asks -> model calls a tool -> Python runs the tool
              -> tool result returns -> model gives a final answer

Run from the agent-lab project folder:
    python local-agents/tests/test_tool_calling.py
"""

import requests

MODEL = "gpt-oss:20b"
OLLAMA_URL = "http://localhost:11434/api/chat"


def get_weather(city: str) -> str:
    fake = {"paris": "18C, light rain", "tokyo": "26C, clear", "delhi": "39C, hazy"}
    return fake.get(city.lower(), f"No data for {city}; assume 22C and sunny.")


def add_numbers(a: float, b: float) -> str:
    return str(a + b)


AVAILABLE_TOOLS = {
    "get_weather": get_weather,
    "add_numbers": add_numbers,
}


TOOL_SCHEMAS = [
    {
        "type": "function",
        "function": {
            "name": "get_weather",
            "description": "Get the current weather for a city.",
            "parameters": {
                "type": "object",
                "properties": {
                    "city": {"type": "string", "description": "City name, e.g. Paris"}
                },
                "required": ["city"],
            },
        },
    },
    {
        "type": "function",
        "function": {
            "name": "add_numbers",
            "description": "Add two numbers together.",
            "parameters": {
                "type": "object",
                "properties": {
                    "a": {"type": "number"},
                    "b": {"type": "number"},
                },
                "required": ["a", "b"],
            },
        },
    },
]


def chat(messages):
    """One round-trip to Ollama. Returns the assistant's message dict."""
    resp = requests.post(
        OLLAMA_URL,
        json={"model": MODEL, "messages": messages, "tools": TOOL_SCHEMAS, "stream": False},
        timeout=180,
    )
    resp.raise_for_status()
    return resp.json()["message"]


def run(question: str):
    print(f"\n{'=' * 70}\nUSER: {question}\n{'=' * 70}")
    messages = [{"role": "user", "content": question}]

    for step in range(1, 6):
        assistant = chat(messages)
        messages.append(assistant)

        tool_calls = assistant.get("tool_calls")
        if not tool_calls:
            print(f"\nFINAL ANSWER: {assistant.get('content')}")
            return

        for call in tool_calls:
            name = call["function"]["name"]
            args = call["function"]["arguments"]
            print(f"  [step {step}] model called: {name}({args})")
            result = AVAILABLE_TOOLS[name](**args)
            print(f"            tool returned: {result}")
            messages.append({"role": "tool", "content": str(result)})

    print("Hit the loop cap without a final answer.")


if __name__ == "__main__":
    run("What's the weather in Tokyo right now?")
    run("What is 4870 plus 159?")

