classdef world < handle

    properties (Hidden)
      pState = [];
    end
    
    properties (Dependent)
        color
        blockSize % How large is each block
        xLim
        yLim
        grid
        gridColor
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
        
        function set.xLim(obj,x)
            obj.pState.xLim = x;
        end
        
        function x = get.xLim(obj)
            x = obj.pState.xLim;
        end
        
        function set.yLim(obj,y)
            obj.pState.yLim = y;
        end
        
        function y = get.yLim(obj)
            y = obj.pState.yLim;
        end
        
        function g = get.grid(obj)
           x = obj.pState.grid;
           if x
               g = 'on';
           else
               g = 'off';
           end
        end
        
        function set.grid(obj,g)
            x = [];
           if isequal(g,'on')
               x = 1;
           elseif isequal(g,'off')
               x = 0;
           elseif x == 1 || x == 0
           else
               error('I did not understand you.  Grid should be on or off.');
           end
           obj.pState.grid = x;
        end
        
        function c = get.gridColor(obj)
            c = obj.pState.gridColor;
        end
        
        function set.gridColor(obj,c)
            obj.pState.gridColor = c;
        end
        
        function sz = get.blockSize(obj)
            sz = obj.pState.blockSize;
        end
        
        function set.blockSize(obj,sz)
            obj.pState.blockSize = sz;
        end
    end
end
