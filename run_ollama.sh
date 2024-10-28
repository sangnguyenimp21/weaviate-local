#!/bin/bash

# Start Ollama in the background.
ollama serve &
# Record Process ID.
pid=$!

# Pause for Ollama to start.
sleep 5

echo "🔴 Retrieve llm model..."
ollama pull llama3.2
echo "🟢 Done!"

echo "🔴 Retrieve nomic-embed-text model..."
ollama pull "nomic-embed-text"
echo "🟢 Done!"

# Wait for Ollama process to finish.
wait $pid

# echo "Waiting for Ollama server to be active..."
# while [ "$(ollama list | grep 'NAME')" == "" ]; do
#   sleep 1
# done