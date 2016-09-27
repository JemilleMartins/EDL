function love.load( )
	
	imagem=love.graphics.newImage("bola.png")
	rec = { x=0,  y=100, w=50, h=50, vx=20, ax=10 }
	p1inicial=rec.x
	pxbola=350
	pybola=550
	phbola=50
	pwbola=50
	dx=0
	dy=0
	velocidade=400
	pfix=pybola

	 --Nome:"pwbola=50"
	-- Propriedade:atribuiçao de valor a variavel
	-- Binding time: execuçao
	-- Explicação:Lua é uma Linguagens com
	--tipagem dinâmica e não fazem verificação de tipos em tempo de compilação,
	--portanto o valor da variavel só é atribuido em tempo de exeçução 
	
end
function love.update(dt)


	rec.vx = rec.vx + rec.ax*dt	
    if  (rec.x<750) then
    	 rec.x  = rec.x  + rec.vx*dt 
    	
    else
    	rec.x  =p1inicial
    	
    end
 -- Nome: palavra reservada "end"
-- Propriedade: semântica 
-- Binding time: design da linguagem
-- Explicação: palavra "end" foi definida para fechamento de blocos
--durante o design da linguagem.
	
	
		pybola=pybola+dy*dt	
	-- Nome: caracter "+"
	-- Propriedade: operação
	-- Binding time: compilação
	-- Explicação:Lua possui tipagem forte isso significa que a linguagem 
	--jamais aplica uma operação a um tipo incorreto,portanto isso é verificado 
	--durante a compilação.	
	 if collides(pxbola,pybola,phbola,pwbola,rec) then
       love.graphics.setBackgroundColor(0,0,255)
       rec.x  =p1inicial

     else
     	love.graphics.setBackgroundColor(0,0,0)
     end

end
function collides (o1x,o1y,o1h,o1w,o2)
     return (o1x <= o2.x + o2.w and
         o2.x <= o1x + o1w and
         o1y <= o2.y+ o2.h and
         o2.y <= o1y + o1h)
    -- Nome: variável "o1x"
	-- Propriedade: endereço
	-- Binding time: execução
	-- Explicação: "o1x" é variável local da função collides,por isso
	-- seu endereço só é determinado quando durante a execução a função é chamada.
end
function love.keypressed(key)

	if love.keyboard.isDown("up") then
         dy = -velocidade
         dx = 0
    end
    -- Nome: caracter "-"
	-- Propriedade: operação
	-- Binding time: compilação
	-- Explicação:Lua possui tipagem forte isso significa que a linguagem 
	--jamais aplica uma operação a um tipo incorreto,portanto isso é verificado 
	--durante a compilação.
	if pybola<=10 then
		pybola=pfix
	end
-- Nome: palavra reservada "if"
-- Propriedade:semântica Teste condicional 
-- Binding time: design da linguagem
-- Explicação: Durante o design da linguagem, decidiu-se que
-- para testar se certa condição é verdadeira fosse usada "if"

end

function love.draw()
	love.graphics.draw(imagem,350,550)
	love.graphics.draw(imagem,pxbola,pybola)
	love.graphics.rectangle('fill', rec.x,rec.y, rec.w,rec.h)
	
end
