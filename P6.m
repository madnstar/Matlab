clear;
clc;

% PARTE P4

x_min=-1;
v_min=-1;
x_max=1;
v_max=1;
h_x=0.01;
h_v=0.01;

x_malla=x_min:h_x:x_max;
v_malla=v_min:h_v:v_max;

[X,V] = meshgrid(x_malla,v_malla);

u1=@(x,v) x.^2+v.^2;
u2=@(x,v) cos(x)+sin(v);

f1=@(u) V;
f2=@(u) u;

[F1,F2,l] = eval_malla(f1,f2,u2,X,V);





params = [h_x, h_v, length(x_malla)-1, length(v_malla)-1, 100];

%  Extraer datos de los parámetros
hx = params(1);
hv = params(2);
nx = params(3);
nv = params(4);
lambda = params(5);

% Reordenamiento de índice
index_to_k =@(i,j) (nx + 1)*(j - 1) + i;
index_to_ij =@(k) [floor(k/(nx+1))+1 , k - (nx+1)*floor(k/(nx+1))+1 ];


% Definir la función-matriz A

indices = [];
valores= [];

largo = (nx+1)*(nv+1);

% genera los índices para la diagonal de A

for i=1:largo-1
    ind = index_to_ij(i);
    display(ind)
    ind1 = ind(1);
    ind2 = ind(2);
    
    f_1 = F1(ind1, ind2);
    
    f_2 = F2(ind1, ind2);
    
    indices= [indices; [i, i]];
    valores = [valores; -lambda - abs(1/hx*f_1) - abs(1/hv*f_2)];
end

% genera los índices para la subdiagonal de A

for i=1:largo-1
    ind = index_to_ij(i);
    ind1 = ind(1);
    ind2 = ind(2);
    
    f_1 = F1(ind1, ind2);
    
    f_2 = F2(ind1, ind2);
    
    if i >1
        indices = [indices; [i, i-1]];
        valores = [valores; -1/hx*f_1*(f_1 <0)];
    end
end

% genera los índices para la superdiagonal de A

for i=1:largo-1
    ind = index_to_ij(i);
    ind1 = ind(1);
    ind2 = ind(2);
    
    f_1 = F1(ind1, ind2);
    
    f_2 = F2(ind1, ind2);

    if i<=largo-1
        indices = [indices; [i, i+1]];
        valores = [valores; 1/hx*f_1*(f_1 >=0)];
    end
end

% genera los índices para la diagonal -(nx+1) de A

for i=1:largo-1
    ind = index_to_ij(i);
    ind1 = ind(1);
    ind2 = ind(2);
    
    f_1 = F1(ind1, ind2);
    
    f_2 = F2(ind1, ind2);
    
    if i-(nx+1)>0
        indices = [indices; [i, i-(nx+1)]];
        valores = [valores; -1/hv*f_2*(f_2 <0)];
    end
end

% genera los índices para la diagonal +(nx+1) de A

for i=1:largo-1
    ind = index_to_ij(i);
    ind1 = ind(1);
    ind2 = ind(2);
    
    f_1 = F1(ind1, ind2);
    
    f_2 = F2(ind1, ind2);
    

    if i>=largo-(nx+1)
        indices = [indices; [i, i+(nx+1)]];
        valores = [valores; 1/hv*f_2*(f_2 >=0)];
    end        
end


% Define A sparse para los valores dichos

A = sparse(indices(:, 1), indices(:,2), valores);
