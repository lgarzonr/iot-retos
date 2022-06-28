set ant 999

atget id id
getpos2 lonSen latSen

set ite 0
battery set 20

loop
wait 5
read mens
rdata mens tipo valor

if((tipo=="hola") && (ant == 999))
   set ant valor
   data mens tipo id
   send mens * valor
end

if(tipo=="alerta")
   send mens ant
end

if (tipo=="stop")
	data mens "stop"
	send mens * valor
	cprint "Para sensor: " id
	wait 1000
	stop
end
delay 5

areadsensor tempSen
rdata tempSen SensTipo idSens temp

if( temp>30)
   data mens "alerta" lonSen latSen
   send mens ant
end

battery bat
if(bat<5)
	data mens "critico" lonSen latSen
	send mens ant
end

inc ite
print ite
if (ite >= 1000)
	stop
end