classdef SignalFunction
    
    methods (Access=public, Static)

        function val = Rect(t)
            if abs(t)<0.5
                val = 1;
            else
                val = 0;
            end
        end

        function val = PointedTriangle(t)
            if t<1 && t>0
                val = t;
            else
                val = 0;
            end
        end


        function val = delta(t,width)
            if abs(t) <= (width/2)
                val = 1;
            else
                val = 0;
            end
        end


        function val = Gaussian(t, sigma)
            val =(1/(sigma*sqrt(2*pi)))*exp(-(1/2)*(t^2)/(sigma^2));
        end
    end % methods
end % class

