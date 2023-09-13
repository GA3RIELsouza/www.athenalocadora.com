var urlAtual = window.location.href;

if (urlAtual.indexOf("cliente.jsp") !== -1) {
    var classe = "cliente";
}else if (urlAtual.indexOf("veiculo.jsp") !== -1) {
    var classe = "veiculo";
}else if (urlAtual.indexOf("marca.jsp") !== -1) {
    var classe = "marca";
}else if (urlAtual.indexOf("modelo.jsp") !== -1) {
    var classe = "modelo";
}else if (urlAtual.indexOf("aluguel.jsp") !== -1) {
    var classe = "aluguel";
}else if (urlAtual.indexOf("pagamento.jsp") !== -1) {
    var classe = "pagamento";
}

function mudaOperacao(operacaoSelecionada) {
    var incluir       = document.getElementById("incluir");
    var excluir       = document.getElementById("excluir");
    var alterar       = document.getElementById("alterar");
    var consultar     = document.getElementById("consultar");
    var formIncluir   = document.getElementById("formIncluir");
    var formExcluir   = document.getElementById("formExcluir");
    var formAlterar   = document.getElementById("formAlterar");
    var formConsultar = document.getElementById("formConsultar");

    switch(operacaoSelecionada.id) {
        case "incluir":
            incluir.classList.add("selected");
            excluir.classList.remove("selected");
            alterar.classList.remove("selected");
            consultar.classList.remove("selected");
            formIncluir.style.display = "";
            formExcluir.style.display = "none";
            formAlterar.style.display = "none";
            formConsultar.style.display = "none";
            if (window.history.replaceState) {
                history.pushState({}, null, "http://localhost:8080/www.athenalocadora.com/form/" + classe + "/" + classe + ".jsp?incluir");
            }
        break;

        case "excluir":
            incluir.classList.remove("selected");
            excluir.classList.add("selected");
            alterar.classList.remove("selected");
            consultar.classList.remove("selected");
            formIncluir.style.display = "none";
            formExcluir.style.display = "";
            formAlterar.style.display = "none";
            formConsultar.style.display = "none";
            if (window.history.replaceState) {
                history.pushState({}, null, "http://localhost:8080/www.athenalocadora.com/form/" + classe + "/" + classe + ".jsp?excluir");
            }
        break;

        case "alterar":
            incluir.classList.remove("selected");
            excluir.classList.remove("selected");
            alterar.classList.add("selected");
            consultar.classList.remove("selected");
            formIncluir.style.display = "none";
            formExcluir.style.display = "none";
            formAlterar.style.display = "";
            formConsultar.style.display = "none";
            if (window.history.replaceState) {
                history.pushState({}, null, "http://localhost:8080/www.athenalocadora.com/form/" + classe + "/" + classe + ".jsp?alterar");
            }
        break;

        case "consultar":
            incluir.classList.remove("selected");
            excluir.classList.remove("selected");
            alterar.classList.remove("selected");
            consultar.classList.add("selected");
            formIncluir.style.display = "none";
            formExcluir.style.display = "none";
            formAlterar.style.display = "none";
            formConsultar.style.display = "";
            if (window.history.replaceState) {
                history.pushState({}, null, "http://localhost:8080/www.athenalocadora.com/form/" + classe + "/" + classe + ".jsp?consultar");
            }
        break;

        default:
            mudaOperacao(document.getElementById("incluir"));
        break;
    }
}

window.onload = function() {
    if(window.location.href.indexOf("?incluir") > -1 || window.location.href.indexOf("Incluir") > -1) {
        mudaOperacao(document.getElementById("incluir"));
    }else if(window.location.href.indexOf("?excluir") > -1 || window.location.href.indexOf("Excluir") > -1) {
        mudaOperacao(document.getElementById("excluir"));
    }else if(window.location.href.indexOf("?alterar") > -1 || window.location.href.indexOf("Alterar") > -1) {
        mudaOperacao(document.getElementById("alterar"));
    }else if(window.location.href.indexOf("?consultar") || window.location.href.indexOf("Consultar") > -1) {
        mudaOperacao(document.getElementById("consultar"));
    }else {
        mudaOperacao(document.getElementById("incluir"));
    }
};