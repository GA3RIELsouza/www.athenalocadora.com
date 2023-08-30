<html lang="pt">
    
    <head>
        
        <script type="text/javascript">
            if (localStorage.getItem("tema")) {
                var elementos  = document.getElementsByTagName("*");
                
                for (var i = 0; i < elementos.length; i++) {
                    elementos[i].classList.remove("tema-azul", "tema-verde", "tema-laranja", "tema-cinza");
                    elementos[i].classList.add(localStorage.getItem("tema"));
                }
            }

            function mudaTema() {
                var temaSelect = document.getElementById("tema-select");
                var elementos  = document.getElementsByTagName("*");
                var temaSelecionado = temaSelect.value;
                
                for (var i = 0; i < elementos.length; i++) {
                    elementos[i].classList.remove("tema-azul", "tema-verde", "tema-laranja", "tema-cinza");

                    switch(temaSelecionado) {
                        case "0":
                            elementos[i].classList.add("tema-azul");
                            localStorage.setItem("tema", "tema-azul");
                        break;

                        case "1":
                            elementos[i].classList.add("tema-verde");
                            localStorage.setItem("tema", "tema-verde");
                        break;

                        case "2":
                            elementos[i].classList.add("tema-laranja");
                            localStorage.setItem("tema", "tema-laranja");
                        break;

                        case "3":
                            elementos[i].classList.add("tema-cinza");
                            localStorage.setItem("tema", "tema-cinza");
                        break;
                    }
                }
            }
        </script>
        
    </head>
    
    <body>
        
        <select class="tema-select" id="tema-select" onchange="mudaTema()">
            <option value="" selected><strong>Selecione o tema desejado</strong></option>
            <option value=0>Azul</option>
            <option value=1>Verde</option>
            <option value=2>Laranja</option>
            <option value=3>Cinza</option>
        </select>
        
    </body>
    
</html>