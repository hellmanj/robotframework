from robot.api.deco import keyword

@keyword(name="User ${user} Selects ${item} From Webshop")
def user_selects_from_webshop(self, user, item):
    print "This is always executed"
    return user, item
