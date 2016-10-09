 
 function love.load()
 	--configuração janela
 	width = love.graphics.getWidth() --pega a largura da janela
	height = love.graphics.getHeight() -- pega a altura da janela
	--configuração janela
	--pegador
	imagemcesta=love.graphics.newImage("img/cesta.png")
	cesta={px=width/2,py=500,v=8,w=130,h=50}
	
	--objetos 
	fruta=love.graphics.newImage("img/fruta.png")
	objetos={}
	--[[
	  A coleção "Objetos" representa uma tabela na qual o seu escopo é global ,
	 por isso a variável é visivel por todo o programa e em qualquer parte do código.
	 Quando declarada "objetos" são reservadas no inicio do programa um conjunto de 
	 células de memória que só são desalocadas quando o finalizamos.Seu tempo de vida
	 se estende durante todo o programa.
	 Nessa tabela podem se inserir e/ou remover objetos.Esses objetos são visiveis em
	 qualquer parte do código.Seu tempo de vida varia quando inserimos ou retiramos os
	 objetos da tabela.Quando inserimos é alocado na memória e quando removemos é desalocado.
	 ]]
	intervalo=0.8
	tempo=intervalo
	largurafruta=50
	alturafruta=50
	--
	pontos =0
	tempodejogo=30.0
	jogando=true

 end
 function criarObjeto(dt)
 	tempo=tempo-(1*dt)
	if tempo<0 then
		tempo=intervalo
		posicaoX=math.random(10,width)
		posicaoy=0
		novoObjeto={x=posicaoX,y=posicaoy,imagem=fruta}
		velocidada=200
		table.insert(objetos,novoObjeto)
		
	end	
	for i,maca in ipairs (objetos) do
			maca.y=maca.y+(velocidada*dt)
			if maca.y>height then
				table.remove(objetos,i)
			end
		end
 	
 end

 function love.update(dt)
 	
 	--controla cesta'
 	if cesta.px>=0 and cesta.px<width then
		if love.keyboard.isDown("d") or love.keyboard.isDown("right") then	
			if cesta.px<(width-2*cesta.h/2) then	
				cesta.px = cesta.px + cesta.v;
			end			
		elseif love.keyboard.isDown("a") or love.keyboard.isDown("left") then
			if cesta.px>0  then
				cesta.px = cesta.px - cesta.v;	
			end	
		end
	end
	--controla cesta
	
	criarObjeto(dt)
	funcionamento(dt)
	colidiu(dt)
	--coltrola o jogo
	if love.keyboard.isDown("space") and jogando==false then
		jogando=true
		tempodejogo=30
		pontos=0

	end
	

end
function funcionamento(dt)
	tempodejogo=tempodejogo-1*dt
		if tempodejogo<=0 then
			jogando=false
			table.remove(objetos,i)
		end

end
 function colisao(x1,y1,w1,h1, x2,y2,w2,h2)
 	 return x1<x2+w2 and x2<x1+w1 and y1< y2+h2 and y2<y1+h1
 end
 
 function colidiu(dt)
 	for i,maca in ipairs (objetos) do
		if colisao(maca.x,maca.y,largurafruta,alturafruta,cesta.px,cesta.py,cesta.w,cesta.h)then
			table.remove(objetos,i)
			pontos=pontos+1		
		end
	end 	
 end
 
 
 function love.draw()
 	if jogando==true then
		love.graphics.print("Pontos: "..pontos,100,50)
 		love.graphics.print("Tempo : "..tempodejogo,100,30)
	end
	if jogando==false then
		love.graphics.print("Pontuação : "..pontos,100,30)
		love.graphics.print("Pressione a tecla 'espaço' para continuar ",100,50)
	end

 	
 	for i,maca in ipairs (objetos) do
		love.graphics.draw(maca.imagem,maca.x,maca.y)
	end
	
 	love.graphics.draw(imagemcesta,cesta.px,cesta.py)


 end