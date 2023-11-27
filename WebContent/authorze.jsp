<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
    // Retrieve the 'code' and 'session_state' parameters from the URL
    String code = request.getParameter("code");
    String sessionState = request.getParameter("session_state");
%>

<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <script type="text/javascript">
        // Function to make a POST request to obtain access and ID tokens
        function obtainTokens() {
            // Define the URL
            var tokenEndpoint = 'https://api.asgardeo.io/t/sheran/oauth2/token';

            // Retrieve parameters from the server-side
            var code = encodeURIComponent('<%= code %>');
            var sessionState = encodeURIComponent('<%= sessionState %>');
            localStorage.setItem('sessionState', sessionState);
            var client_Id = 'ThWAxD0WwVBzO8jtBM5fLbAbmU8a';
            var client_secret = 'oEuOSbK0g5ICVDfv1bSovsACVFu4cm_1bbbUjmILvBka';
            var redirect_uri = 'http://localhost:8080/SR_Reservation/authorze.jsp';

            // Define the request body parameters
            var bodyParams = new URLSearchParams();
            bodyParams.append('code', code);
            bodyParams.append('grant_type', 'authorization_code');
            bodyParams.append('client_id', client_Id);
            bodyParams.append('client_secret', client_secret);
            bodyParams.append('redirect_uri', redirect_uri);

            // Define the request options
            var requestOptions = {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                data: bodyParams.toString() // Convert bodyParams to a string
            };

            // Make the POST request using jQuery AJAX
            $.ajax(tokenEndpoint, requestOptions)
                .done(function (data) {
                    // Handle the response data here
                    console.log(data.access_token);
                    var access_token = data.access_token;
                    var id_token = data.access_token;
                    localStorage.setItem('accessToken', access_token);
                    localStorage.setItem('idToken', id_token);
                    window.location.href = "./home.jsp";
                })
                .fail(function (error) {
                    // Handle any errors here
                    console.error('Error:', error);
                    window.location.href = "./index.jsp";
                });
        }

        // Call the function to obtain tokens when the page loads
        obtainTokens();
    </script>
</body>
</html>
