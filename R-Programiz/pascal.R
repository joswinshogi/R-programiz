n=as.integer(readline(""))
for(i in 1:n){
  cat(rep("",n-i+1))
  num=1
  for(j in 1:n){
    if(num!=0)
      cat(num,"")
    num=num*(i-j)/j
  }
  cat("")
}