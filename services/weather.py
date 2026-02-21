import random
from typing import Dict, Any, Optional

def get_simulated_weather_risk(location: Optional[str]) -> Dict[str, Any]:
    """
    Simulates weather risk if a location is provided. 
    Returns dummy temperature, humidity and associated risks.
    """
    if not location:
        return {"risk": "unknown", "message": "No location provided."}
        
    temp = round(random.uniform(10.0, 35.0), 1)
    humidity = round(random.uniform(40.0, 95.0), 1)
    
    risk_level = "low"
    if temp > 15 and temp < 25 and humidity > 80:
        risk_level = "high"
    elif humidity > 70:
        risk_level = "moderate"
        
    return {
        "temperature_c": temp,
        "humidity_percent": humidity,
        "risk": risk_level,
        "message": f"Simulated risk based on {temp}°C and {humidity}% humidity."
    }
