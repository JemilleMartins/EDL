
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

end
function love.update(dt)


	rec.vx = rec.vx + rec.ax*dt	
    if  (rec.x<750) then
    	 rec.x  = rec.x  + rec.vx*dt 
    	
    else
    	rec.x  =p1inicial
    	
    end
	
	--for i=1,10 do	
		pybola=pybola+dy*dt		
	--end
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
end
function love.keypressed(key)

	if love.keyboard.isDown("up") then
         dy = -velocidade
         dx = 0
    end
	if pybola<=10 then
		pybola=pfix
	end
end

function love.draw()
	love.graphics.draw(imagem,350,550)
	love.graphics.draw(imagem,pxbola,pybola)
	love.graphics.rectangle('fill', rec.x,rec.y, rec.w,rec.h)
	
end