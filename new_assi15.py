import random

# Greetings for the chatbot
greetings = ["Hello! How can I assist you today?", "Hi there! How can I help?", "Welcome! What can I do for you?"]

# Responses to common customer inquiries
responses = {
    "order_status": "To check your order status, please visit our website and log in to your account.",
    "product_info": "You can find detailed product information on our website. Do you have a specific product in mind?",
    "return_policy": "Our return policy allows returns within 30 days of purchase. Please review our website for more details.",
    "contact_info": "You can contact our customer support at support@example.com or call us at 123-456-7890.",
    "default": "I'm sorry, I couldn't understand your request. Please feel free to ask another question."
}

def chatbot_response(user_input):
    user_input = user_input.lower()

    if "hello" in user_input or "hi" in user_input:
        return random.choice(greetings)
    
    elif "order status" in user_input:
        return responses["order_status"]
    
    elif "product" in user_input:
        return responses["product_info"]
    
    elif "return policy" in user_input:
        return responses["return_policy"]
    
    elif "contact" in user_input or "support" in user_input:
        return responses["contact_info"]
    
    else:
        return responses["default"]

print("Customer Service Chatbot: Hello! How can I assist you today?")

while True:
    user_input = input("You: ")
    if user_input.lower() == "bye" or user_input.lower() == "exit":
        print("Customer Service Chatbot: Goodbye! Have a great day.")
        break
    response = chatbot_response(user_input)   #calling
    print("Customer Service Chatbot:", response)
