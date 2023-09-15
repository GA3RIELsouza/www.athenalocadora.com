<%
    int tema = -1;

    if(cookies != null) {
       for(Cookie atual : cookies) {
            if(atual.getName().equals("themeId")) {
                tema = Integer.parseInt(atual.getValue());
            }
        }
    }
    
    switch(tema) {
        case 0: // Claro
            %>
            <style>
                :root {
                    --color1: #D7D7D7;
                    --color2: #E1E1E1;
                    --color3: #EBEBEB;
                    --color4: #F5F5F5;
                    --color5: #FFFFFF;
                    color: black;

                    body {
                        background-image: url("/www.athenalocadora.com/images/background_claro.png");
                        background-size: cover;
                        background-repeat: no-repeat; 
                    }
                }
            </style>
            <%
        break;
        
        case 1: // Escuro
            %>
            <style>
                :root {
                    --color1: #000000;
                    --color2: #0C0C0C;
                    --color3: #191919;
                    --color4: #262626;
                    --color5: #333333;
                    --font-color: white;

                    body {
                        background-image: url("/www.athenalocadora.com/images/background_escuro.png");
                        background-size: cover;
                        background-repeat: no-repeat; 
                    }
                }
            </style>
            <%
        break;
        
        case 2: // Azul
            %>
            <style>
                :root {
                    --color1: #27A4F2;
                    --color2: #3EAEF4;
                    --color3: #6EC2F7;
                    --color4: #9FD7F9;
                    --color5: #CFEBFC;
                    color: black;

                    body {
                        background-image: url("/www.athenalocadora.com/images/background_azul.png");
                        background-size: cover;
                        background-repeat: no-repeat; 
                    }
                }
            </style>
            <%
        break;
        
        case 3: // Verde
            %>
            <style>
                :root {
                    --color1: #24C16E;
                    --color2: #80E6AF;
                    --color3: #AAEDC9;
                    --color4: #D4F7E4;
                    --color5: #E9FBF0;
                    color: black;

                    body {
                        background-image: url("/www.athenalocadora.com/images/background_verde.png");
                        background-size: cover;
                        background-repeat: no-repeat; 
                    }
                }
            </style>
            <%
        break;
        
        case 4: // Laranja
            %>
            <style>
                :root {
                    --color1: #F5A940;
                    --color2: #F7BF5E;
                    --color3: #FAD47B;
                    --color4: #FCEA99;
                    --color5: #FFFFB6;
                    color: black;

                    body {
                        background-image: url("/www.athenalocadora.com/images/background_laranja.png");
                        background-size: cover;
                        background-repeat: no-repeat; 
                    }
                }
            </style>
            <%
        break;
        
        default: // Laranja
            %>
            <style>
                :root {
                    --color1: #F5A940;
                    --color2: #F7BF5E;
                    --color3: #FAD47B;
                    --color4: #FCEA99;
                    --color5: #FFFFB6;
                    color: black;

                    body {
                        background-image: url("/www.athenalocadora.com/images/background_laranja.png");
                        background-size: cover;
                        background-repeat: no-repeat; 
                    }
                }
            </style>
            <%
        break;
    }
%>