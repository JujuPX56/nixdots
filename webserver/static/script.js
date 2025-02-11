var input = document.getElementById('messageInput');

function sendMessage() {
	console.log(input.innerText);
  let myVariable = "Hello from JavaScript!";

            // Send the data using fetch API (AJAX)
            fetch('/', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ my_variable: myVariable })
  }
}
