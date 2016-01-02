classdef thing < handle
    
    properties (Hidden) %(Access='private')
        pWorldState;
        pId;
        pPosition;
        pSize;
        pPatch;
        pName;
    end
    
    properties(Dependent)
        id
        color
        position
    end
    
    methods
        function obj = thing(W,id,name,pos)
            obj.pWorldState = W;
            obj.pId = id;
            obj.pPosition = pos; % Bottom left corner.
            obj.pSize = [20 20]; % Width and height
            obj.pPatch = createPatch(W.axis, pos,obj.pSize);
            obj.pName = name;
        end
        
        function s = name(obj)
            s = obj.pName;
        end
                
        function w = width(obj)
            w = obj.pSize(1);
        end
        
        function h = height(obj)
            h = obj.pSize(2);
        end
        function id = get.id(obj)
            id = obj.pId;
        end
        
        function p = get.position(obj)
            p = obj.pPosition;
        end
        
        function set.position(obj,pos)
            obj.pWorldState.registerMove(obj,pos);
            obj.pPosition = pos;
            movePatch(obj.pPatch,pos,obj.pSize);
        end
        
        function move(obj, delta)
            obj.position = obj.position + delta;
        end
        
        function c = get.color(obj)
            c = obj.pPatch.FaceColor;
        end
        
        function set.color(obj,c)
            obj.pPatch.FaceColor = c;
        end
        
        function delete(obj)
            obj.pWorldState = [];
        end
    end
end

function movePatch(p,pos,size)
    v = patchVertices(pos,size);
    p.Vertices = v;
end

function p = createPatch(parent,pos,size)

v = patchVertices(pos,size);

p = patch('Vertices',v,'FaceColor',[1 1 1],'Faces',[1 2 3 4],'Parent',parent);

end

function v = patchVertices(pos,size)
x1 = pos(1);
x2 = pos(1) + size(1);
y1 = pos(2);
y2 = pos(2) + size(2);

v = [x1 y1 
    x2 y1
    x2 y2 
    x1 y2];
end