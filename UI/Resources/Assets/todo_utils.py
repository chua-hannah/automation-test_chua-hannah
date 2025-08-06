import re

def extract_todo_count(counter_text: str) -> int:
    """
    Extracts the numeric todo count from the second line of the given counter_text.
    Assumes the text format is:
        todo-counter
        0 items
    """
    lines = counter_text.splitlines()
    if len(lines) < 2:
        raise ValueError("Counter text does not contain enough lines.")
    
    match = re.search(r'\d+', lines[1])
    if not match:
        raise ValueError(f"Could not find a number in: {lines[1]}")
    
    return int(match.group(0))
