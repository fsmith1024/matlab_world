classdef world < handle

    properties (Hidden)
      pState = [];
    end
    
    properties (Dependent)
        color
    end
    
    methods
        function obj = world()
           obj.pState = worldState();
        end
        
        function delete(obj)
            delete(obj.pState);
        end
        
        function t = make(obj,varargin)
            t = obj.pState.make(varargin{:});
        end     
        
        function c = get.color(obj)
            c = obj.pState.color;
        end
        
        function set.color(obj,c)
            obj.pState.color = c;
        end
    end
end
