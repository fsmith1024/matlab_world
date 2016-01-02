%% Example 1 -- Introduction to the world.
%
% The window containing this text is called the editor window.  It shows
% you the contents of a file.  The name of the file is in the title bar.
% This file is call ex01.m.  The ".m" means MATLAB will try to run this
% file.  You can open and work on multiple files at the same time.
%
% To run this file hit the "Run" button.  Not yet.  When you hit run MATLAB
% will attempt to execute the commands in this file.  We'll describe
% commands below.
%
% Everything to the right of % is a comment.
% This is a comment.  Comments don't do anything, but they are useful for
% explaining what your commands are doing.
% 
% Lines that start with %% create a new section.  You can run one section
% at a time by hitting "Run and Advance" to see what the commands in each
% section do.  Try pressing "Run and Advance" now.  You should see the
% cursor move to the next section and highlight it.  This section had no
% commands so nothing else should have happened.

%% The first command -- creating the world.
% In these exercises you will be working in a small 2-dimensional world
% containing blocks.  This command creates a new world called "w".
w = world;
% Notice: The command is in black, and comments are in green.  Run this
% section now.

%% Tidy up
% You should now see a window titled "Figure 1: World" with a black
% background.  This is window shows you the world.  Move and resize this
% window and the MATLAB window so that they don't overlap.  If you cannot
% see the world, it is probably behind the MATLAB desktop.  Continue once
% you have completed this task.

%% Adding a thing to the world.
% Our world contains blocks.  We can create a new block by asking the world
% to create one.
t = w.make;
% We have now created a new block in our world and called it "t".

%% The command window
% Below the Editor Window you should see the command Window.  You can enter
% commands in the command window to see what they do.  MATLAB will run your
% command after you press enter.  This can be very helpful when trying to
% understand what is happening in the world.
%
% Try typing the following in the command window to see what happens:
%    >> t
% Note: Do not type >>, put your cursor after >> and then type the
% following commands.  You should see output similar to the following:
% >> t
%
% t = 
%
%  thing with properties:
%
%          id: 1
%       color: [1 1 1]
%    position: [0 0]
%
% Your thing has a position, a color, and an id.  
%

%% Change the color.
% You can change these properties of your thing.  For example, let's change
% the color.  Colors are created by mixing red, green, and blue.  Each
% component color (red, green, or blue) has a brightness level between 0
% and 1.  Here are some example colors.  See if you get the idea:
%     white [1 1 1]
%     black [0 0 0]
%     red   [1 0 0]
%     green [0 1 0]
%     blue  [0 0 1]
%     pink  [1 0.5 0.5]
% Here we can make our thing red.
t.color = [1 0 0];
% After you run this command, your block should turn red.  Now use the
% command window to try different colors. Note: The way you right the
% commands is important.  Dot "." is used to access properties.  Equals "="
% assigns a value into a property or a name.  And square brackets around a
% bunch of numbers bundles them together into a vector.  The semi-colon
% prevents MATLAB from displaying the result, and is optional.

%% Change the position
% Just like you can change the color you can change the position.  The
% position is represented as an x and y position.  All blocks start off
% life at (0,0) which is the middle of the world.  You can set the position
% to change where the block is.
t.position = [100 100];
% Positions work just like graphing in school.  The X-axis goes left to
% right from smaller to larger numbers.  The Y-axis goes up and down.

%% Motion
% To make your block move you need to set it to many different positions.
% Instead of setting it to a specific place by setting the position, you
% can ask your block to move a certain distance in x and y from its current
% position by asking it to move.
t.move([10 0]);
% That command moved your block 0 distance in the y direction and 10 steps
% in the x direction.

%% Continuous motion
% To repeatedly move a block use a for-loop:
t.position = [0 0];
for k = 1:20
    t.move([5,5]);
end
% This for-loop executes the commands in the loop 20 times.  You can put
% many commands in a loop. 

%% The first challenge
%  The file challenge01.m contains your first challenge.  We will close the
%  current world and clear all the variables so that you can start from a
%  blank slate
clear all
% Now open the challenge.
edit challenge01.m