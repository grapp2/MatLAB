function result = input(~, ~, injectedAnswer)
% Overloaded input function for use in testing. Since input only takes two arguments,
% passing a third argument injects the desired answer the user is returning.
persistent ANSWER;
result = nan;
if nargin > 2
    ANSWER = injectedAnswer;
elseif ~isempty(ANSWER)
    result = ANSWER(1);
    ANSWER(1) = [];
end
