classdef worldState < handle
    properties (Hidden)
        pFigure = [];
        pAxis = [];
        pXLim = [-250 250];
        pYLim = [-250 250];
        pThings = [];
        pMoved = false(0,0);
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
        end
        
        function a = axis(obj)
            a = obj.pAxis;
        end
        
        function t = make(obj,name)
            if nargin < 2
                name = 'foobar';
            end
            pos = [0 0];
            id = numel(obj.pThings) + 1;
            t = thing(obj,id,name,pos);
            if isempty(obj.pThings)
                obj.pThings = t;
            else
                obj.pThings(id) = t;
            end
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
    end
end
