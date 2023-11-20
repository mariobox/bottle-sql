% include('header.tpl')
<h2>Attendees</h2>
  <ul>
    % for item in data:
      % if len(item) == 3:
      <li>{{item[0]}} party of {{item[1]}} will bring {{item[2]}}</li>

      % else:
      <li>{{item[0]}} | {{item[1]}}</li>
      % end
    % end
  </ul> 

% include('footer.tpl')