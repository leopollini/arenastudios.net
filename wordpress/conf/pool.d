[www]
user = www-data
group = www-data
listen = wordpress:80
pm = dynamic
pm.start_servers = 6
pm.max_children = 25
pm.min_spare_servers = 2
pm.max_spare_servers = 10
