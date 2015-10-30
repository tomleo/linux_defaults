function kdjango
    for i in (ps -C "python manage.py runserver" -o pid | awk '/[0-9]+/'); kill $i; end;
end
