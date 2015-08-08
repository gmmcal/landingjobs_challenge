# O Desafio

Gostariamos que fosse implementado um protótipo semelhante ao [StartupStack](https://startupstack.io).

A aplicação deve usar a nossa API ([https://github.com/LandingJobs/LandingJobs-api](https://github.com/LandingJobs/LandingJobs-api)) para obter os dados necessários (empresas e skills), mas deve guardar os dados na sua própria BD para não estar sempre a pedir os mesmos dados à API. 

A applicação deve ler dados da API no máximo uma vez por hora. (Por uma questão de simplicidade, gera um API token para o teu utilizador aqui: [https://landing.jobs/settings](https://landing.jobs/settings) e usa esse token para o acesso da API)

A nível de front-end, deve ter o mesmo tipo de funcionalidade do [https://startupstack.io](startupstack.io): Escolher uma ou mais skills para obter uma lista de empresas que procuram candidatos nessas tecnologias, com o nome e logo da empresa, e o link para o respectivo site.

Não precisam de fazer um design muito polido, mas queriamos ver algum trabalho de frontend. Funcional, nada demasiado complexo. Por exemplo, um layout semelhante ao do [https://startupstack.io](startupstack.io)
