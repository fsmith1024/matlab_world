classdef worldState < handle
    properties (Hidden)
        pFigure = [];
        pAxis = [];
        pXLim = [-250 250];
        pYLim = [-250 250];
        pThings = [];
        pMoved = false(0,0);
        pGrid = 0;
        pGridColor = [1 1 1];
        pBlockSize;
    end
    
    properties (Dependent)
        color
        xLim
        yLim
        gridColor
        grid
        blockSize
    end
    
    methods
        function obj = worldState
            F = figure(...
                'ToolBar','none' ...
                ,'MenuBar','none' ...
                ,'Name','World'...
                ,'Color',[ 0 0 0]...
                );
            A = axes(...
                'Parent',F ....
                ,'XLimMode','manual'...
                ,'YLimMode','manual'...
                ,'XLim',obj.pXLim ....
                ,'YLim',obj.pYLim);
            axis(A,'equal','off');
            A.XLimMode = 'manual';
            A.YLimMode = 'manual';
            
            obj.pFigure = F;
            obj.pAxis = A;
            obj.pBlockSize = [20 20];
        end
        
        function a = axis(obj)
            a = obj.pAxis;
        end
        
        function c = get.color(obj)
            c = obj.pFigure.Color;
        end
        
        function set.color(obj,c)
            obj.pFigure.Color = c;
            obj.refreshGrid;
        end
        
        function t = make(obj,name)
            if nargin < 2
                name = 'foobar';
            end
            pos = [0 0];
            id = numel(obj.pThings) + 1;
            t = thing(obj,id,name,pos,obj.blockSize);
            if isempty(obj.pThings)
                obj.pThings = t;
            else
                obj.pThings(id) = t;
            end
        end
        
        function set.blockSize(obj,sz)
            obj.pBlockSize = sz;
        end
        
        function sz = get.blockSize(obj)
            sz = obj.pBlockSize;
        end
        
        function registerMove(obj,thing,~) %newPosition)
            m = obj.pMoved;
            id = thing.id;
            if id <= numel(m) && m(id)
                pause(0.1);
                obj.pMoved = false(1,numel(obj.pThings));
            end
            obj.pMoved(id) = true;
        end
        
        function delete(obj)
            if ishandle(obj.pFigure)
                close(obj.pFigure);
            end
            obj.pFigure = [];
            obj.pAxis= [];
            T = obj.pThings;
            obj.pThings = [];
            for i = 1:numel(T)
                delete(T(i));
            end
        end
        
        function set.xLim(obj,x)
            obj.pAxis.XLim = x;
        end
        
        function x = get.xLim(obj)
            x = obj.pAxis.XLim;
        end
        
        function set.yLim(obj,y)
            obj.pAxis.YLim = y;
        end
        
        function y = get.yLim(obj)
            y = obj.pAxis.YLim;
        end
        
        function g = get.grid(obj)
            g = obj.pGrid;
        end
        
        function set.grid(obj,x)
            if obj.pGrid == x
                return;
            end
            obj.pGrid = x;
            obj.refreshGrid();
        end
        
        function c = get.gridColor(obj)
            c = obj.pGridColor;
        end
        
        function set.gridColor(obj,c)
            if isequal(obj.pGridColor,c)
                return;
            end
            obj.pGridColor = c;
            obj.refreshGrid();
        end
        
        function refreshGrid(obj)
            changeGridHelper(obj.pAxis,obj.pGrid,obj.color,obj.pGridColor);
        end
    end
end

function changeGridHelper(ax,enable,backgroundColor,gridColor)

if enable
    ax.XAxis.Color = gridColor;
    ax.YAxis.Color = gridColor;
    ax.GridColor = gridColor;
    ax.GridAlpha = 0.3;
    ax.XGrid = 'on';
    ax.YGrid = 'on';
    ax.Color = backgroundColor;
    ax.Visible = 'on';
else
    ax.Visible = 'off';
end
end
