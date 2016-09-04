#codigo

>function love.load()
>>   fogos = love.graphics.newImage("fogos.png")
>   
>end
> 
>function love.draw()
>
>>love.graphics.draw(fogos, 400, 10)
> 
>>   love.graphics.setColor(0, 255, 0, 255)
>
>>   love.graphics.print("Olá Mundo!", 200, 200)
>   
>end
