% include('header.tpl')

% if len(data) == 0:
  <h2>So far, nobody is bringing {{food}} :\</h2>
% elif len(data[0]) == 3:
  <h2>Attendees</h2>
% else:
  <h2>People bringing {{food}}</h2>
% end

    <ul>
      % for item in data:
        % if len(item) == 3:
        <li>{{item[0]}} party of {{item[1]}} will bring {{item[2]}}</li>
        % else:
        <li>{{item[0]}}</li>
        % end
      % end
    </ul> 
% include('footer.tpl')