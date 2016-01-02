classdef world < handle

    properties (Hidden)
      pState = [];
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
    end
end
