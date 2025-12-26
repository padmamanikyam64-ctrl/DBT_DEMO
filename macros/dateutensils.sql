{% macro function1(x) %}

case
    when to_timestamp({{ x }}) < current_timestamp then 'PAST'
    else 'FUTURE'
end

{% endmacro %}