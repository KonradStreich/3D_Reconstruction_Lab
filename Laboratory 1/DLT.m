function L = DLT(Points_2D, Points_3D)
% gets L1 to L11 from two sets of points

    N = size(Points_2D,2);

    u = zeros(N,1);
    v = zeros(N,1);

    X = zeros(size(Points_3D,2),1);
    Y = zeros(size(X));
    Z = zeros(size(X));
 

    for k = 1:N
        u(k) = Points_2D(k).coord(1);
        v(k) = Points_2D(k).coord(2);
        
        objName = Points_2D(k).name;
        [obj, index] = GetObject( Points_3D, objName );

        X(k) = Points_3D(index).coord(1);
        Y(k) = Points_3D(index).coord(2);
        Z(k) = Points_3D(index).coord(3);
        
        
    end

    A = zeros(2*N,11);
    b = zeros(2*N,1);
    
    for k = 1:N
        m = 2 * k;
        A(m-1,:)   = [X(k) Y(k) Z(k) 1 0 0 0 0 -u(k)*X(k) -u(k)*Y(k) -u(k)*Z(k)];
        A(m,:) = [0 0 0 0 X(k) Y(k) Z(k) 1 -v(k)*X(k) -v(k)*Y(k) -v(k)*Z(k)];
        b(m-1) = u(k);
        b(m) = v(k);
    end

    L = mldivide(A,b);

end