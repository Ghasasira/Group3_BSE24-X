echo
echo "Starting Netflix UI in the background..."
serve -s netflix-ui &

echo
echo "Beginning backend service..."
npm run start 
