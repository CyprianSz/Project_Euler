function fibo(limit){
	liczby = [1,2];
	var i=0;
	while(liczby[i+1]<limit){
		if((liczby[i+0]+liczby[i+1])<limit){
			liczby.push(liczby[i+0]+liczby[i+1]);
		}
		i++;
	}
	return liczby;
}

function sum(){
	var suma=0;
	for(i=0;i<liczby.length;i++){
		if(liczby[i]%2===0){
		suma+=liczby[i];
		}
	}
	return suma;
}

console.log(sum(fibo(4000000)))
