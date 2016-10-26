function result = perceptron(classes,class_labels,w_init,rho)

    if ~exist('rho','var')
        %eğer rho girilmez ise sabit olarak 0.01 al
            rho = 0.01;
    end
    
    result = w_init;
  
    %check iterasyonlar sırasında iteleme işlemi yapılıp yapılmadığını
    %kontrol etmek amacıyla kullanıldı.
    %ilk iterasyonda while a girmesi için 1 olarak initialize edildi.
    check = 1;
    
    %yapılan iterasyonlar sonucu check değişkeninin değeri 0 ise iteleme
    %yapılmadığı için while döngüsü sona erecektir.
    while check > 0
        %check değişkeninin default değeri 0
        %yani herhangi bir iteleme olmadığını belirtiyor.
        check = 0;
            for i=1:size(classes,2)
                %dot product sonucunun 0 dan küçük veya büyük olması ile
                %vectorün ait olduğu class tahmin ediliyor.
                product = dot(result,[classes(:,i);1]);
                    if product > 0
                           %tahmin edilen class ile gerçek class
                           %karşılaştırılıyor.
                       if class_labels(i) == 2
                           %uyuşmazlık olduğu için iteleme yapılıyor ve
                           %check değeri 1'e eşitleniyor yani bu iterasyon
                           %sırasında iteleme yapıldı ve henüz tam doğru
                           %değer elde edilemedi
                           result = result - rho*[classes(:,i);1];
                           check = 1;
                       end    
                    else
                           %tahmin edilen class ile gerçek class
                           %karşılaştırılıyor.
                        if class_labels(i)== 1     
                           %uyuşmazlık olduğu için iteleme yapılıyor ve
                           %check değeri 1'e eşitleniyor yani bu iterasyon
                           %sırasında iteleme yapıldı ve henüz tam doğru
                           %değer elde edilemedi
                            result = result + rho*[classes(:,i);1];
                            check = 1;
                        end
                    end    
            end    
    end    
return
end

