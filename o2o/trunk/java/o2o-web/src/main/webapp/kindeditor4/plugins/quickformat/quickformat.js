/*
 * Copyright (c) 2009-2016 SHENZHEN Eternal Dynasty Technology Co.,Ltd.
 * All rights reserved.
 *  
 * This file contains valuable properties of  SHENZHEN Eternal Dynasty 
 * Technology Co.,Ltd.,  embodying  substantial  creative efforts  and 
 * confidential information, ideas and expressions.    No part of this 
 * file may be reproduced or distributed in any form or by  any  means,
 * or stored in a data base or a retrieval system,  without  the prior 
 * written permission  of  SHENZHEN Eternal Dynasty Technology Co.,Ltd.
 *
 */

KindEditor.plugin('quickformat', function(K) {
	var self = this, name = 'quickformat',
		blockMap = K.toMap('blockquote,center,div,h1,h2,h3,h4,h5,h6,p');
	function getFirstChild(knode) {
		var child = knode.first();
		while (child && child.first()) {
			child = child.first();
		}
		return child;
	}
	self.clickToolbar(name, function() {
		self.focus();
		var doc = self.edit.doc,
			range = self.cmd.range,
			child = K(doc.body).first(), next,
			nodeList = [], subList = [],
			bookmark = range.createBookmark(true);
		while(child) {
			next = child.next();
			var firstChild = getFirstChild(child);
			if (!firstChild || firstChild.name != 'img') {
				if (blockMap[child.name]) {
					child.html(child.html().replace(/^(\s|&nbsp;|　)+/ig, ''));
					child.css('text-indent', '2em');
				} else {
					subList.push(child);
				}
				if (!next || (blockMap[next.name] || blockMap[child.name] && !blockMap[next.name])) {
					if (subList.length > 0) {
						nodeList.push(subList);
					}
					subList = [];
				}
			}
			child = next;
		}
		K.each(nodeList, function(i, subList) {
			var wrapper = K('<p style="text-indent:2em;"></p>', doc);
			subList[0].before(wrapper);
			K.each(subList, function(i, knode) {
				wrapper.append(knode);
			});
		});
		range.moveToBookmark(bookmark);
		self.addBookmark();
	});
});

/**
--------------------------
abcd<br />
1234<br />

to

<p style="text-indent:2em;">
	abcd<br />
	1234<br />
</p>

--------------------------

&nbsp; abcd<img>1233
<p>1234</p>

to

<p style="text-indent:2em;">abcd<img>1233</p>
<p style="text-indent:2em;">1234</p>

--------------------------
*/