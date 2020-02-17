! function(e, t) {
	"use strict";
	"object" == typeof module && "object" == typeof module.exports ? module.exports = e.document ? t(e, !0) : function(e) {
		if (!e.document) throw new Error("jQuery requires a window with a document");
		return t(e)
	} : t(e)
}("undefined" != typeof window ? window : this, function(E, e) {
	"use strict";
	var t = [],
		C = E.document,
		i = Object.getPrototypeOf,
		s = t.slice,
		m = t.concat,
		l = t.push,
		o = t.indexOf,
		n = {},
		r = n.toString,
		p = n.hasOwnProperty,
		a = p.toString,
		c = a.call(Object),
		g = {};

	function v(e, t) {
		var n = (t = t || C).createElement("script");
		n.text = e, t.head.appendChild(n).parentNode.removeChild(n)
	}

	function u(e, t) {
		return t.toUpperCase()
	}
	var d = "3.2.1",
		T = function(e, t) {
			return new T.fn.init(e, t)
		},
		f = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g,
		h = /^-ms-/,
		y = /-([a-z])/g;

	function b(e) {
		var t = !!e && "length" in e && e.length,
			n = T.type(e);
		return "function" !== n && !T.isWindow(e) && ("array" === n || 0 === t || "number" == typeof t && 0 < t && t - 1 in e)
	}
	T.fn = T.prototype = {
		jquery: d,
		constructor: T,
		length: 0,
		toArray: function() {
			return s.call(this)
		},
		get: function(e) {
			return null == e ? s.call(this) : e < 0 ? this[e + this.length] : this[e]
		},
		pushStack: function(e) {
			var t = T.merge(this.constructor(), e);
			return t.prevObject = this, t
		},
		each: function(e) {
			return T.each(this, e)
		},
		map: function(n) {
			return this.pushStack(T.map(this, function(e, t) {
				return n.call(e, t, e)
			}))
		},
		slice: function() {
			return this.pushStack(s.apply(this, arguments))
		},
		first: function() {
			return this.eq(0)
		},
		last: function() {
			return this.eq(-1)
		},
		eq: function(e) {
			var t = this.length,
				n = +e + (e < 0 ? t : 0);
			return this.pushStack(0 <= n && n < t ? [this[n]] : [])
		},
		end: function() {
			return this.prevObject || this.constructor()
		},
		push: l,
		sort: t.sort,
		splice: t.splice
	}, T.extend = T.fn.extend = function() {
		var e, t, n, i, o, r, a = arguments[0] || {},
			s = 1,
			l = arguments.length,
			c = !1;
		for ("boolean" == typeof a && (c = a, a = arguments[s] || {}, s++), "object" == typeof a || T.isFunction(a) || (a = {}), s === l && (a = this, s--); s < l; s++)
			if (null != (e = arguments[s]))
				for (t in e) n = a[t], a !== (i = e[t]) && (c && i && (T.isPlainObject(i) || (o = Array.isArray(i))) ? (r = o ? (o = !1, n && Array.isArray(n) ? n : []) : n && T.isPlainObject(n) ? n : {}, a[t] = T.extend(c, r, i)) : void 0 !== i && (a[t] = i));
		return a
	}, T.extend({
		expando: "jQuery" + (d + Math.random()).replace(/\D/g, ""),
		isReady: !0,
		error: function(e) {
			throw new Error(e)
		},
		noop: function() {},
		isFunction: function(e) {
			return "function" === T.type(e)
		},
		isWindow: function(e) {
			return null != e && e === e.window
		},
		isNumeric: function(e) {
			var t = T.type(e);
			return ("number" === t || "string" === t) && !isNaN(e - parseFloat(e))
		},
		isPlainObject: function(e) {
			var t, n;
			return !(!e || "[object Object]" !== r.call(e) || (t = i(e)) && ("function" != typeof(n = p.call(t, "constructor") && t.constructor) || a.call(n) !== c))
		},
		isEmptyObject: function(e) {
			var t;
			for (t in e) return !1;
			return !0
		},
		type: function(e) {
			return null == e ? e + "" : "object" == typeof e || "function" == typeof e ? n[r.call(e)] || "object" : typeof e
		},
		globalEval: function(e) {
			v(e)
		},
		camelCase: function(e) {
			return e.replace(h, "ms-").replace(y, u)
		},
		each: function(e, t) {
			var n, i = 0;
			if (b(e))
				for (n = e.length; i < n && !1 !== t.call(e[i], i, e[i]); i++);
			else
				for (i in e)
					if (!1 === t.call(e[i], i, e[i])) break; return e
		},
		trim: function(e) {
			return null == e ? "" : (e + "").replace(f, "")
		},
		makeArray: function(e, t) {
			var n = t || [];
			return null != e && (b(Object(e)) ? T.merge(n, "string" == typeof e ? [e] : e) : l.call(n, e)), n
		},
		inArray: function(e, t, n) {
			return null == t ? -1 : o.call(t, e, n)
		},
		merge: function(e, t) {
			for (var n = +t.length, i = 0, o = e.length; i < n; i++) e[o++] = t[i];
			return e.length = o, e
		},
		grep: function(e, t, n) {
			for (var i = [], o = 0, r = e.length, a = !n; o < r; o++) !t(e[o], o) != a && i.push(e[o]);
			return i
		},
		map: function(e, t, n) {
			var i, o, r = 0,
				a = [];
			if (b(e))
				for (i = e.length; r < i; r++) null != (o = t(e[r], r, n)) && a.push(o);
			else
				for (r in e) null != (o = t(e[r], r, n)) && a.push(o);
			return m.apply([], a)
		},
		guid: 1,
		proxy: function(e, t) {
			var n, i, o;
			if ("string" == typeof t && (n = e[t], t = e, e = n), T.isFunction(e)) return i = s.call(arguments, 2), (o = function() {
				return e.apply(t || this, i.concat(s.call(arguments)))
			}).guid = e.guid = e.guid || T.guid++, o
		},
		now: Date.now,
		support: g
	}), "function" == typeof Symbol && (T.fn[Symbol.iterator] = t[Symbol.iterator]), T.each("Boolean Number String Function Array Date RegExp Object Error Symbol".split(" "), function(e, t) {
		n["[object " + t + "]"] = t.toLowerCase()
	});
	var w = function(n) {
		function d(e, t, n) {
			var i = "0x" + t - 65536;
			return i != i || n ? t : i < 0 ? String.fromCharCode(65536 + i) : String.fromCharCode(i >> 10 | 55296, 1023 & i | 56320)
		}

		function o() {
			x()
		}
		var e, h, w, r, a, p, f, m, _, l, c, x, E, s, C, g, u, v, y, T = "sizzle" + 1 * new Date,
			b = n.document,
			S = 0,
			i = 0,
			D = ae(),
			A = ae(),
			k = ae(),
			N = function(e, t) {
				return e === t && (c = !0), 0
			},
			I = {}.hasOwnProperty,
			t = [],
			O = t.pop,
			$ = t.push,
			j = t.push,
			P = t.slice,
			L = function(e, t) {
				for (var n = 0, i = e.length; n < i; n++)
					if (e[n] === t) return n;
				return -1
			},
			M = "checked|selected|async|autofocus|autoplay|controls|defer|disabled|hidden|ismap|loop|multiple|open|readonly|required|scoped",
			H = "[\\x20\\t\\r\\n\\f]",
			R = "(?:\\\\.|[\\w-]|[^\0-\\xa0])+",
			q = "\\[" + H + "*(" + R + ")(?:" + H + "*([*^$|!~]?=)" + H + "*(?:'((?:\\\\.|[^\\\\'])*)'|\"((?:\\\\.|[^\\\\\"])*)\"|(" + R + "))|)" + H + "*\\]",
			F = ":(" + R + ")(?:\\((('((?:\\\\.|[^\\\\'])*)'|\"((?:\\\\.|[^\\\\\"])*)\")|((?:\\\\.|[^\\\\()[\\]]|" + q + ")*)|.*)\\)|)",
			W = new RegExp(H + "+", "g"),
			B = new RegExp("^" + H + "+|((?:^|[^\\\\])(?:\\\\.)*)" + H + "+$", "g"),
			U = new RegExp("^" + H + "*," + H + "*"),
			K = new RegExp("^" + H + "*([>+~]|" + H + ")" + H + "*"),
			V = new RegExp("=" + H + "*([^\\]'\"]*?)" + H + "*\\]", "g"),
			X = new RegExp(F),
			Y = new RegExp("^" + R + "$"),
			z = {
				ID: new RegExp("^#(" + R + ")"),
				CLASS: new RegExp("^\\.(" + R + ")"),
				TAG: new RegExp("^(" + R + "|[*])"),
				ATTR: new RegExp("^" + q),
				PSEUDO: new RegExp("^" + F),
				CHILD: new RegExp("^:(only|first|last|nth|nth-last)-(child|of-type)(?:\\(" + H + "*(even|odd|(([+-]|)(\\d*)n|)" + H + "*(?:([+-]|)" + H + "*(\\d+)|))" + H + "*\\)|)", "i"),
				bool: new RegExp("^(?:" + M + ")$", "i"),
				needsContext: new RegExp("^" + H + "*[>+~]|:(even|odd|eq|gt|lt|nth|first|last)(?:\\(" + H + "*((?:-\\d)?\\d*)" + H + "*\\)|)(?=[^-]|$)", "i")
			},
			Q = /^(?:input|select|textarea|button)$/i,
			G = /^h\d$/i,
			J = /^[^{]+\{\s*\[native \w/,
			Z = /^(?:#([\w-]+)|(\w+)|\.([\w-]+))$/,
			ee = /[+~]/,
			te = new RegExp("\\\\([\\da-f]{1,6}" + H + "?|(" + H + ")|.)", "ig"),
			ne = /([\0-\x1f\x7f]|^-?\d)|^-$|[^\0-\x1f\x7f-\uFFFF\w-]/g,
			ie = function(e, t) {
				return t ? "\0" === e ? "�" : e.slice(0, -1) + "\\" + e.charCodeAt(e.length - 1).toString(16) + " " : "\\" + e
			},
			oe = ye(function(e) {
				return !0 === e.disabled && ("form" in e || "label" in e)
			}, {
				dir: "parentNode",
				next: "legend"
			});
		try {
			j.apply(t = P.call(b.childNodes), b.childNodes), t[b.childNodes.length].nodeType
		} catch (e) {
			j = {
				apply: t.length ? function(e, t) {
					$.apply(e, P.call(t))
				} : function(e, t) {
					for (var n = e.length, i = 0; e[n++] = t[i++];);
					e.length = n - 1
				}
			}
		}

		function re(e, t, n, i) {
			var o, r, a, s, l, c, u, d = t && t.ownerDocument,
				f = t ? t.nodeType : 9;
			if (n = n || [], "string" != typeof e || !e || 1 !== f && 9 !== f && 11 !== f) return n;
			if (!i && ((t ? t.ownerDocument || t : b) !== E && x(t), t = t || E, C)) {
				if (11 !== f && (l = Z.exec(e)))
					if (o = l[1]) {
						if (9 === f) {
							if (!(a = t.getElementById(o))) return n;
							if (a.id === o) return n.push(a), n
						} else if (d && (a = d.getElementById(o)) && y(t, a) && a.id === o) return n.push(a), n
					} else {
						if (l[2]) return j.apply(n, t.getElementsByTagName(e)), n;
						if ((o = l[3]) && h.getElementsByClassName && t.getElementsByClassName) return j.apply(n, t.getElementsByClassName(o)), n
					}
				if (h.qsa && !k[e + " "] && (!g || !g.test(e))) {
					if (1 !== f) d = t, u = e;
					else if ("object" !== t.nodeName.toLowerCase()) {
						for ((s = t.getAttribute("id")) ? s = s.replace(ne, ie) : t.setAttribute("id", s = T), r = (c = p(e)).length; r--;) c[r] = "#" + s + " " + ve(c[r]);
						u = c.join(","), d = ee.test(e) && me(t.parentNode) || t
					}
					if (u) try {
						return j.apply(n, d.querySelectorAll(u)), n
					} catch (e) {} finally {
						s === T && t.removeAttribute("id")
					}
				}
			}
			return m(e.replace(B, "$1"), t, n, i)
		}

		function ae() {
			var i = [];
			return function e(t, n) {
				return i.push(t + " ") > w.cacheLength && delete e[i.shift()], e[t + " "] = n
			}
		}

		function se(e) {
			return e[T] = !0, e
		}

		function le(e) {
			var t = E.createElement("fieldset");
			try {
				return !!e(t)
			} catch (e) {
				return !1
			} finally {
				t.parentNode && t.parentNode.removeChild(t), t = null
			}
		}

		function ce(e, t) {
			for (var n = e.split("|"), i = n.length; i--;) w.attrHandle[n[i]] = t
		}

		function ue(e, t) {
			var n = t && e,
				i = n && 1 === e.nodeType && 1 === t.nodeType && e.sourceIndex - t.sourceIndex;
			if (i) return i;
			if (n)
				for (; n = n.nextSibling;)
					if (n === t) return -1;
			return e ? 1 : -1
		}

		function de(t) {
			return function(e) {
				return "input" === e.nodeName.toLowerCase() && e.type === t
			}
		}

		function fe(n) {
			return function(e) {
				var t = e.nodeName.toLowerCase();
				return ("input" === t || "button" === t) && e.type === n
			}
		}

		function he(t) {
			return function(e) {
				return "form" in e ? e.parentNode && !1 === e.disabled ? "label" in e ? "label" in e.parentNode ? e.parentNode.disabled === t : e.disabled === t : e.isDisabled === t || e.isDisabled !== !t && oe(e) === t : e.disabled === t : "label" in e && e.disabled === t
			}
		}

		function pe(a) {
			return se(function(r) {
				return r = +r, se(function(e, t) {
					for (var n, i = a([], e.length, r), o = i.length; o--;) e[n = i[o]] && (e[n] = !(t[n] = e[n]))
				})
			})
		}

		function me(e) {
			return e && void 0 !== e.getElementsByTagName && e
		}
		for (e in h = re.support = {}, a = re.isXML = function(e) {
				var t = e && (e.ownerDocument || e).documentElement;
				return !!t && "HTML" !== t.nodeName
			}, x = re.setDocument = function(e) {
				var t, n, i = e ? e.ownerDocument || e : b;
				return i !== E && 9 === i.nodeType && i.documentElement && (s = (E = i).documentElement, C = !a(E), b !== E && (n = E.defaultView) && n.top !== n && (n.addEventListener ? n.addEventListener("unload", o, !1) : n.attachEvent && n.attachEvent("onunload", o)), h.attributes = le(function(e) {
					return e.className = "i", !e.getAttribute("className")
				}), h.getElementsByTagName = le(function(e) {
					return e.appendChild(E.createComment("")), !e.getElementsByTagName("*").length
				}), h.getElementsByClassName = J.test(E.getElementsByClassName), h.getById = le(function(e) {
					return s.appendChild(e).id = T, !E.getElementsByName || !E.getElementsByName(T).length
				}), h.getById ? (w.filter.ID = function(e) {
					var t = e.replace(te, d);
					return function(e) {
						return e.getAttribute("id") === t
					}
				}, w.find.ID = function(e, t) {
					if (void 0 !== t.getElementById && C) {
						var n = t.getElementById(e);
						return n ? [n] : []
					}
				}) : (w.filter.ID = function(e) {
					var n = e.replace(te, d);
					return function(e) {
						var t = void 0 !== e.getAttributeNode && e.getAttributeNode("id");
						return t && t.value === n
					}
				}, w.find.ID = function(e, t) {
					if (void 0 !== t.getElementById && C) {
						var n, i, o, r = t.getElementById(e);
						if (r) {
							if ((n = r.getAttributeNode("id")) && n.value === e) return [r];
							for (o = t.getElementsByName(e), i = 0; r = o[i++];)
								if ((n = r.getAttributeNode("id")) && n.value === e) return [r]
						}
						return []
					}
				}), w.find.TAG = h.getElementsByTagName ? function(e, t) {
					return void 0 !== t.getElementsByTagName ? t.getElementsByTagName(e) : h.qsa ? t.querySelectorAll(e) : void 0
				} : function(e, t) {
					var n, i = [],
						o = 0,
						r = t.getElementsByTagName(e);
					if ("*" !== e) return r;
					for (; n = r[o++];) 1 === n.nodeType && i.push(n);
					return i
				}, w.find.CLASS = h.getElementsByClassName && function(e, t) {
					if (void 0 !== t.getElementsByClassName && C) return t.getElementsByClassName(e)
				}, u = [], g = [], (h.qsa = J.test(E.querySelectorAll)) && (le(function(e) {
					s.appendChild(e).innerHTML = "<a id='" + T + "'></a><select id='" + T + "-\r\\' msallowcapture=''><option selected=''></option></select>", e.querySelectorAll("[msallowcapture^='']").length && g.push("[*^$]=" + H + "*(?:''|\"\")"), e.querySelectorAll("[selected]").length || g.push("\\[" + H + "*(?:value|" + M + ")"), e.querySelectorAll("[id~=" + T + "-]").length || g.push("~="), e.querySelectorAll(":checked").length || g.push(":checked"), e.querySelectorAll("a#" + T + "+*").length || g.push(".#.+[+~]")
				}), le(function(e) {
					e.innerHTML = "<a href='' disabled='disabled'></a><select disabled='disabled'><option/></select>";
					var t = E.createElement("input");
					t.setAttribute("type", "hidden"), e.appendChild(t).setAttribute("name", "D"), e.querySelectorAll("[name=d]").length && g.push("name" + H + "*[*^$|!~]?="), 2 !== e.querySelectorAll(":enabled").length && g.push(":enabled", ":disabled"), s.appendChild(e).disabled = !0, 2 !== e.querySelectorAll(":disabled").length && g.push(":enabled", ":disabled"), e.querySelectorAll("*,:x"), g.push(",.*:")
				})), (h.matchesSelector = J.test(v = s.matches || s.webkitMatchesSelector || s.mozMatchesSelector || s.oMatchesSelector || s.msMatchesSelector)) && le(function(e) {
					h.disconnectedMatch = v.call(e, "*"), v.call(e, "[s!='']:x"), u.push("!=", F)
				}), g = g.length && new RegExp(g.join("|")), u = u.length && new RegExp(u.join("|")), t = J.test(s.compareDocumentPosition), y = t || J.test(s.contains) ? function(e, t) {
					var n = 9 === e.nodeType ? e.documentElement : e,
						i = t && t.parentNode;
					return e === i || !(!i || 1 !== i.nodeType || !(n.contains ? n.contains(i) : e.compareDocumentPosition && 16 & e.compareDocumentPosition(i)))
				} : function(e, t) {
					if (t)
						for (; t = t.parentNode;)
							if (t === e) return !0;
					return !1
				}, N = t ? function(e, t) {
					if (e === t) return c = !0, 0;
					var n = !e.compareDocumentPosition - !t.compareDocumentPosition;
					return n || (1 & (n = (e.ownerDocument || e) === (t.ownerDocument || t) ? e.compareDocumentPosition(t) : 1) || !h.sortDetached && t.compareDocumentPosition(e) === n ? e === E || e.ownerDocument === b && y(b, e) ? -1 : t === E || t.ownerDocument === b && y(b, t) ? 1 : l ? L(l, e) - L(l, t) : 0 : 4 & n ? -1 : 1)
				} : function(e, t) {
					if (e === t) return c = !0, 0;
					var n, i = 0,
						o = e.parentNode,
						r = t.parentNode,
						a = [e],
						s = [t];
					if (!o || !r) return e === E ? -1 : t === E ? 1 : o ? -1 : r ? 1 : l ? L(l, e) - L(l, t) : 0;
					if (o === r) return ue(e, t);
					for (n = e; n = n.parentNode;) a.unshift(n);
					for (n = t; n = n.parentNode;) s.unshift(n);
					for (; a[i] === s[i];) i++;
					return i ? ue(a[i], s[i]) : a[i] === b ? -1 : s[i] === b ? 1 : 0
				}), E
			}, re.matches = function(e, t) {
				return re(e, null, null, t)
			}, re.matchesSelector = function(e, t) {
				if ((e.ownerDocument || e) !== E && x(e), t = t.replace(V, "='$1']"), h.matchesSelector && C && !k[t + " "] && (!u || !u.test(t)) && (!g || !g.test(t))) try {
					var n = v.call(e, t);
					if (n || h.disconnectedMatch || e.document && 11 !== e.document.nodeType) return n
				} catch (e) {}
				return 0 < re(t, E, null, [e]).length
			}, re.contains = function(e, t) {
				return (e.ownerDocument || e) !== E && x(e), y(e, t)
			}, re.attr = function(e, t) {
				(e.ownerDocument || e) !== E && x(e);
				var n = w.attrHandle[t.toLowerCase()],
					i = n && I.call(w.attrHandle, t.toLowerCase()) ? n(e, t, !C) : void 0;
				return void 0 !== i ? i : h.attributes || !C ? e.getAttribute(t) : (i = e.getAttributeNode(t)) && i.specified ? i.value : null
			}, re.escape = function(e) {
				return (e + "").replace(ne, ie)
			}, re.error = function(e) {
				throw new Error("Syntax error, unrecognized expression: " + e)
			}, re.uniqueSort = function(e) {
				var t, n = [],
					i = 0,
					o = 0;
				if (c = !h.detectDuplicates, l = !h.sortStable && e.slice(0), e.sort(N), c) {
					for (; t = e[o++];) t === e[o] && (i = n.push(o));
					for (; i--;) e.splice(n[i], 1)
				}
				return l = null, e
			}, r = re.getText = function(e) {
				var t, n = "",
					i = 0,
					o = e.nodeType;
				if (o) {
					if (1 === o || 9 === o || 11 === o) {
						if ("string" == typeof e.textContent) return e.textContent;
						for (e = e.firstChild; e; e = e.nextSibling) n += r(e)
					} else if (3 === o || 4 === o) return e.nodeValue
				} else
					for (; t = e[i++];) n += r(t);
				return n
			}, (w = re.selectors = {
				cacheLength: 50,
				createPseudo: se,
				match: z,
				attrHandle: {},
				find: {},
				relative: {
					">": {
						dir: "parentNode",
						first: !0
					},
					" ": {
						dir: "parentNode"
					},
					"+": {
						dir: "previousSibling",
						first: !0
					},
					"~": {
						dir: "previousSibling"
					}
				},
				preFilter: {
					ATTR: function(e) {
						return e[1] = e[1].replace(te, d), e[3] = (e[3] || e[4] || e[5] || "").replace(te, d), "~=" === e[2] && (e[3] = " " + e[3] + " "), e.slice(0, 4)
					},
					CHILD: function(e) {
						return e[1] = e[1].toLowerCase(), "nth" === e[1].slice(0, 3) ? (e[3] || re.error(e[0]), e[4] = +(e[4] ? e[5] + (e[6] || 1) : 2 * ("even" === e[3] || "odd" === e[3])), e[5] = +(e[7] + e[8] || "odd" === e[3])) : e[3] && re.error(e[0]), e
					},
					PSEUDO: function(e) {
						var t, n = !e[6] && e[2];
						return z.CHILD.test(e[0]) ? null : (e[3] ? e[2] = e[4] || e[5] || "" : n && X.test(n) && (t = p(n, !0)) && (t = n.indexOf(")", n.length - t) - n.length) && (e[0] = e[0].slice(0, t), e[2] = n.slice(0, t)), e.slice(0, 3))
					}
				},
				filter: {
					TAG: function(e) {
						var t = e.replace(te, d).toLowerCase();
						return "*" === e ? function() {
							return !0
						} : function(e) {
							return e.nodeName && e.nodeName.toLowerCase() === t
						}
					},
					CLASS: function(e) {
						var t = D[e + " "];
						return t || (t = new RegExp("(^|" + H + ")" + e + "(" + H + "|$)")) && D(e, function(e) {
							return t.test("string" == typeof e.className && e.className || void 0 !== e.getAttribute && e.getAttribute("class") || "")
						})
					},
					ATTR: function(n, i, o) {
						return function(e) {
							var t = re.attr(e, n);
							return null == t ? "!=" === i : !i || (t += "", "=" === i ? t === o : "!=" === i ? t !== o : "^=" === i ? o && 0 === t.indexOf(o) : "*=" === i ? o && -1 < t.indexOf(o) : "$=" === i ? o && t.slice(-o.length) === o : "~=" === i ? -1 < (" " + t.replace(W, " ") + " ").indexOf(o) : "|=" === i && (t === o || t.slice(0, o.length + 1) === o + "-"))
						}
					},
					CHILD: function(p, e, t, m, g) {
						var v = "nth" !== p.slice(0, 3),
							y = "last" !== p.slice(-4),
							b = "of-type" === e;
						return 1 === m && 0 === g ? function(e) {
							return !!e.parentNode
						} : function(e, t, n) {
							var i, o, r, a, s, l, c = v != y ? "nextSibling" : "previousSibling",
								u = e.parentNode,
								d = b && e.nodeName.toLowerCase(),
								f = !n && !b,
								h = !1;
							if (u) {
								if (v) {
									for (; c;) {
										for (a = e; a = a[c];)
											if (b ? a.nodeName.toLowerCase() === d : 1 === a.nodeType) return !1;
										l = c = "only" === p && !l && "nextSibling"
									}
									return !0
								}
								if (l = [y ? u.firstChild : u.lastChild], y && f) {
									for (h = (s = (i = (o = (r = (a = u)[T] || (a[T] = {}))[a.uniqueID] || (r[a.uniqueID] = {}))[p] || [])[0] === S && i[1]) && i[2], a = s && u.childNodes[s]; a = ++s && a && a[c] || (h = s = 0) || l.pop();)
										if (1 === a.nodeType && ++h && a === e) {
											o[p] = [S, s, h];
											break
										}
								} else if (f && (h = s = (i = (o = (r = (a = e)[T] || (a[T] = {}))[a.uniqueID] || (r[a.uniqueID] = {}))[p] || [])[0] === S && i[1]), !1 === h)
									for (;
										(a = ++s && a && a[c] || (h = s = 0) || l.pop()) && ((b ? a.nodeName.toLowerCase() !== d : 1 !== a.nodeType) || !++h || (f && ((o = (r = a[T] || (a[T] = {}))[a.uniqueID] || (r[a.uniqueID] = {}))[p] = [S, h]), a !== e)););
								return (h -= g) === m || h % m == 0 && 0 <= h / m
							}
						}
					},
					PSEUDO: function(e, r) {
						var t, a = w.pseudos[e] || w.setFilters[e.toLowerCase()] || re.error("unsupported pseudo: " + e);
						return a[T] ? a(r) : 1 < a.length ? (t = [e, e, "", r], w.setFilters.hasOwnProperty(e.toLowerCase()) ? se(function(e, t) {
							for (var n, i = a(e, r), o = i.length; o--;) e[n = L(e, i[o])] = !(t[n] = i[o])
						}) : function(e) {
							return a(e, 0, t)
						}) : a
					}
				},
				pseudos: {
					not: se(function(e) {
						var i = [],
							o = [],
							s = f(e.replace(B, "$1"));
						return s[T] ? se(function(e, t, n, i) {
							for (var o, r = s(e, null, i, []), a = e.length; a--;)(o = r[a]) && (e[a] = !(t[a] = o))
						}) : function(e, t, n) {
							return i[0] = e, s(i, null, n, o), i[0] = null, !o.pop()
						}
					}),
					has: se(function(t) {
						return function(e) {
							return 0 < re(t, e).length
						}
					}),
					contains: se(function(t) {
						return t = t.replace(te, d),
							function(e) {
								return -1 < (e.textContent || e.innerText || r(e)).indexOf(t)
							}
					}),
					lang: se(function(n) {
						return Y.test(n || "") || re.error("unsupported lang: " + n), n = n.replace(te, d).toLowerCase(),
							function(e) {
								var t;
								do {
									if (t = C ? e.lang : e.getAttribute("xml:lang") || e.getAttribute("lang")) return (t = t.toLowerCase()) === n || 0 === t.indexOf(n + "-")
								} while ((e = e.parentNode) && 1 === e.nodeType);
								return !1
							}
					}),
					target: function(e) {
						var t = n.location && n.location.hash;
						return t && t.slice(1) === e.id
					},
					root: function(e) {
						return e === s
					},
					focus: function(e) {
						return e === E.activeElement && (!E.hasFocus || E.hasFocus()) && !!(e.type || e.href || ~e.tabIndex)
					},
					enabled: he(!1),
					disabled: he(!0),
					checked: function(e) {
						var t = e.nodeName.toLowerCase();
						return "input" === t && !!e.checked || "option" === t && !!e.selected
					},
					selected: function(e) {
						return e.parentNode && e.parentNode.selectedIndex, !0 === e.selected
					},
					empty: function(e) {
						for (e = e.firstChild; e; e = e.nextSibling)
							if (e.nodeType < 6) return !1;
						return !0
					},
					parent: function(e) {
						return !w.pseudos.empty(e)
					},
					header: function(e) {
						return G.test(e.nodeName)
					},
					input: function(e) {
						return Q.test(e.nodeName)
					},
					button: function(e) {
						var t = e.nodeName.toLowerCase();
						return "input" === t && "button" === e.type || "button" === t
					},
					text: function(e) {
						var t;
						return "input" === e.nodeName.toLowerCase() && "text" === e.type && (null == (t = e.getAttribute("type")) || "text" === t.toLowerCase())
					},
					first: pe(function() {
						return [0]
					}),
					last: pe(function(e, t) {
						return [t - 1]
					}),
					eq: pe(function(e, t, n) {
						return [n < 0 ? n + t : n]
					}),
					even: pe(function(e, t) {
						for (var n = 0; n < t; n += 2) e.push(n);
						return e
					}),
					odd: pe(function(e, t) {
						for (var n = 1; n < t; n += 2) e.push(n);
						return e
					}),
					lt: pe(function(e, t, n) {
						for (var i = n < 0 ? n + t : n; 0 <= --i;) e.push(i);
						return e
					}),
					gt: pe(function(e, t, n) {
						for (var i = n < 0 ? n + t : n; ++i < t;) e.push(i);
						return e
					})
				}
			}).pseudos.nth = w.pseudos.eq, {
				radio: !0,
				checkbox: !0,
				file: !0,
				password: !0,
				image: !0
			}) w.pseudos[e] = de(e);
		for (e in {
				submit: !0,
				reset: !0
			}) w.pseudos[e] = fe(e);

		function ge() {}

		function ve(e) {
			for (var t = 0, n = e.length, i = ""; t < n; t++) i += e[t].value;
			return i
		}

		function ye(s, e, t) {
			var l = e.dir,
				c = e.next,
				u = c || l,
				d = t && "parentNode" === u,
				f = i++;
			return e.first ? function(e, t, n) {
				for (; e = e[l];)
					if (1 === e.nodeType || d) return s(e, t, n);
				return !1
			} : function(e, t, n) {
				var i, o, r, a = [S, f];
				if (n) {
					for (; e = e[l];)
						if ((1 === e.nodeType || d) && s(e, t, n)) return !0
				} else
					for (; e = e[l];)
						if (1 === e.nodeType || d)
							if (o = (r = e[T] || (e[T] = {}))[e.uniqueID] || (r[e.uniqueID] = {}), c && c === e.nodeName.toLowerCase()) e = e[l] || e;
							else {
								if ((i = o[u]) && i[0] === S && i[1] === f) return a[2] = i[2];
								if ((o[u] = a)[2] = s(e, t, n)) return !0
							} return !1
			}
		}

		function be(o) {
			return 1 < o.length ? function(e, t, n) {
				for (var i = o.length; i--;)
					if (!o[i](e, t, n)) return !1;
				return !0
			} : o[0]
		}

		function we(e, t, n, i, o) {
			for (var r, a = [], s = 0, l = e.length, c = null != t; s < l; s++)(r = e[s]) && (n && !n(r, i, o) || (a.push(r), c && t.push(s)));
			return a
		}

		function _e(h, p, m, g, v, e) {
			return g && !g[T] && (g = _e(g)), v && !v[T] && (v = _e(v, e)), se(function(e, t, n, i) {
				var o, r, a, s = [],
					l = [],
					c = t.length,
					u = e || function(e, t, n) {
						for (var i = 0, o = t.length; i < o; i++) re(e, t[i], n);
						return n
					}(p || "*", n.nodeType ? [n] : n, []),
					d = !h || !e && p ? u : we(u, s, h, n, i),
					f = m ? v || (e ? h : c || g) ? [] : t : d;
				if (m && m(d, f, n, i), g)
					for (o = we(f, l), g(o, [], n, i), r = o.length; r--;)(a = o[r]) && (f[l[r]] = !(d[l[r]] = a));
				if (e) {
					if (v || h) {
						if (v) {
							for (o = [], r = f.length; r--;)(a = f[r]) && o.push(d[r] = a);
							v(null, f = [], o, i)
						}
						for (r = f.length; r--;)(a = f[r]) && -1 < (o = v ? L(e, a) : s[r]) && (e[o] = !(t[o] = a))
					}
				} else f = we(f === t ? f.splice(c, f.length) : f), v ? v(null, t, f, i) : j.apply(t, f)
			})
		}

		function xe(e) {
			for (var o, t, n, i = e.length, r = w.relative[e[0].type], a = r || w.relative[" "], s = r ? 1 : 0, l = ye(function(e) {
					return e === o
				}, a, !0), c = ye(function(e) {
					return -1 < L(o, e)
				}, a, !0), u = [function(e, t, n) {
					var i = !r && (n || t !== _) || ((o = t).nodeType ? l : c)(e, t, n);
					return o = null, i
				}]; s < i; s++)
				if (t = w.relative[e[s].type]) u = [ye(be(u), t)];
				else {
					if ((t = w.filter[e[s].type].apply(null, e[s].matches))[T]) {
						for (n = ++s; n < i && !w.relative[e[n].type]; n++);
						return _e(1 < s && be(u), 1 < s && ve(e.slice(0, s - 1).concat({
							value: " " === e[s - 2].type ? "*" : ""
						})).replace(B, "$1"), t, s < n && xe(e.slice(s, n)), n < i && xe(e = e.slice(n)), n < i && ve(e))
					}
					u.push(t)
				}
			return be(u)
		}

		function Ee(g, v) {
			function e(e, t, n, i, o) {
				var r, a, s, l = 0,
					c = "0",
					u = e && [],
					d = [],
					f = _,
					h = e || b && w.find.TAG("*", o),
					p = S += null == f ? 1 : Math.random() || .1,
					m = h.length;
				for (o && (_ = t === E || t || o); c !== m && null != (r = h[c]); c++) {
					if (b && r) {
						for (a = 0, t || r.ownerDocument === E || (x(r), n = !C); s = g[a++];)
							if (s(r, t || E, n)) {
								i.push(r);
								break
							}
						o && (S = p)
					}
					y && ((r = !s && r) && l--, e && u.push(r))
				}
				if (l += c, y && c !== l) {
					for (a = 0; s = v[a++];) s(u, d, t, n);
					if (e) {
						if (0 < l)
							for (; c--;) u[c] || d[c] || (d[c] = O.call(i));
						d = we(d)
					}
					j.apply(i, d), o && !e && 0 < d.length && 1 < l + v.length && re.uniqueSort(i)
				}
				return o && (S = p, _ = f), u
			}
			var y = 0 < v.length,
				b = 0 < g.length;
			return y ? se(e) : e
		}
		return ge.prototype = w.filters = w.pseudos, w.setFilters = new ge, p = re.tokenize = function(e, t) {
			var n, i, o, r, a, s, l, c = A[e + " "];
			if (c) return t ? 0 : c.slice(0);
			for (a = e, s = [], l = w.preFilter; a;) {
				for (r in n && !(i = U.exec(a)) || (i && (a = a.slice(i[0].length) || a), s.push(o = [])), n = !1, (i = K.exec(a)) && (n = i.shift(), o.push({
						value: n,
						type: i[0].replace(B, " ")
					}), a = a.slice(n.length)), w.filter) !(i = z[r].exec(a)) || l[r] && !(i = l[r](i)) || (n = i.shift(), o.push({
					value: n,
					type: r,
					matches: i
				}), a = a.slice(n.length));
				if (!n) break
			}
			return t ? a.length : a ? re.error(e) : A(e, s).slice(0)
		}, f = re.compile = function(e, t) {
			var n, i = [],
				o = [],
				r = k[e + " "];
			if (!r) {
				for (n = (t = t || p(e)).length; n--;)(r = xe(t[n]))[T] ? i.push(r) : o.push(r);
				(r = k(e, Ee(o, i))).selector = e
			}
			return r
		}, m = re.select = function(e, t, n, i) {
			var o, r, a, s, l, c = "function" == typeof e && e,
				u = !i && p(e = c.selector || e);
			if (n = n || [], 1 === u.length) {
				if (2 < (r = u[0] = u[0].slice(0)).length && "ID" === (a = r[0]).type && 9 === t.nodeType && C && w.relative[r[1].type]) {
					if (!(t = (w.find.ID(a.matches[0].replace(te, d), t) || [])[0])) return n;
					c && (t = t.parentNode), e = e.slice(r.shift().value.length)
				}
				for (o = z.needsContext.test(e) ? 0 : r.length; o-- && (a = r[o], !w.relative[s = a.type]);)
					if ((l = w.find[s]) && (i = l(a.matches[0].replace(te, d), ee.test(r[0].type) && me(t.parentNode) || t))) {
						if (r.splice(o, 1), !(e = i.length && ve(r))) return j.apply(n, i), n;
						break
					}
			}
			return (c || f(e, u))(i, t, !C, n, !t || ee.test(e) && me(t.parentNode) || t), n
		}, h.sortStable = T.split("").sort(N).join("") === T, h.detectDuplicates = !!c, x(), h.sortDetached = le(function(e) {
			return 1 & e.compareDocumentPosition(E.createElement("fieldset"))
		}), le(function(e) {
			return e.innerHTML = "<a href='#'></a>", "#" === e.firstChild.getAttribute("href")
		}) || ce("type|href|height|width", function(e, t, n) {
			if (!n) return e.getAttribute(t, "type" === t.toLowerCase() ? 1 : 2)
		}), h.attributes && le(function(e) {
			return e.innerHTML = "<input/>", e.firstChild.setAttribute("value", ""), "" === e.firstChild.getAttribute("value")
		}) || ce("value", function(e, t, n) {
			if (!n && "input" === e.nodeName.toLowerCase()) return e.defaultValue
		}), le(function(e) {
			return null == e.getAttribute("disabled")
		}) || ce(M, function(e, t, n) {
			var i;
			if (!n) return !0 === e[t] ? t.toLowerCase() : (i = e.getAttributeNode(t)) && i.specified ? i.value : null
		}), re
	}(E);
	T.find = w, T.expr = w.selectors, T.expr[":"] = T.expr.pseudos, T.uniqueSort = T.unique = w.uniqueSort, T.text = w.getText, T.isXMLDoc = w.isXML, T.contains = w.contains, T.escapeSelector = w.escape;

	function _(e, t, n) {
		for (var i = [], o = void 0 !== n;
			(e = e[t]) && 9 !== e.nodeType;)
			if (1 === e.nodeType) {
				if (o && T(e).is(n)) break;
				i.push(e)
			}
		return i
	}

	function x(e, t) {
		for (var n = []; e; e = e.nextSibling) 1 === e.nodeType && e !== t && n.push(e);
		return n
	}
	var S = T.expr.match.needsContext;

	function D(e, t) {
		return e.nodeName && e.nodeName.toLowerCase() === t.toLowerCase()
	}
	var A = /^<([a-z][^\/\0>:\x20\t\r\n\f]*)[\x20\t\r\n\f]*\/?>(?:<\/\1>|)$/i,
		k = /^.[^:#\[\.,]*$/;

	function N(e, n, i) {
		return T.isFunction(n) ? T.grep(e, function(e, t) {
			return !!n.call(e, t, e) !== i
		}) : n.nodeType ? T.grep(e, function(e) {
			return e === n !== i
		}) : "string" != typeof n ? T.grep(e, function(e) {
			return -1 < o.call(n, e) !== i
		}) : k.test(n) ? T.filter(n, e, i) : (n = T.filter(n, e), T.grep(e, function(e) {
			return -1 < o.call(n, e) !== i && 1 === e.nodeType
		}))
	}
	T.filter = function(e, t, n) {
		var i = t[0];
		return n && (e = ":not(" + e + ")"), 1 === t.length && 1 === i.nodeType ? T.find.matchesSelector(i, e) ? [i] : [] : T.find.matches(e, T.grep(t, function(e) {
			return 1 === e.nodeType
		}))
	}, T.fn.extend({
		find: function(e) {
			var t, n, i = this.length,
				o = this;
			if ("string" != typeof e) return this.pushStack(T(e).filter(function() {
				for (t = 0; t < i; t++)
					if (T.contains(o[t], this)) return !0
			}));
			for (n = this.pushStack([]), t = 0; t < i; t++) T.find(e, o[t], n);
			return 1 < i ? T.uniqueSort(n) : n
		},
		filter: function(e) {
			return this.pushStack(N(this, e || [], !1))
		},
		not: function(e) {
			return this.pushStack(N(this, e || [], !0))
		},
		is: function(e) {
			return !!N(this, "string" == typeof e && S.test(e) ? T(e) : e || [], !1).length
		}
	});
	var I, O = /^(?:\s*(<[\w\W]+>)[^>]*|#([\w-]+))$/;
	(T.fn.init = function(e, t, n) {
		var i, o;
		if (!e) return this;
		if (n = n || I, "string" != typeof e) return e.nodeType ? (this[0] = e, this.length = 1, this) : T.isFunction(e) ? void 0 !== n.ready ? n.ready(e) : e(T) : T.makeArray(e, this);
		if (!(i = "<" === e[0] && ">" === e[e.length - 1] && 3 <= e.length ? [null, e, null] : O.exec(e)) || !i[1] && t) return !t || t.jquery ? (t || n).find(e) : this.constructor(t).find(e);
		if (i[1]) {
			if (t = t instanceof T ? t[0] : t, T.merge(this, T.parseHTML(i[1], t && t.nodeType ? t.ownerDocument || t : C, !0)), A.test(i[1]) && T.isPlainObject(t))
				for (i in t) T.isFunction(this[i]) ? this[i](t[i]) : this.attr(i, t[i]);
			return this
		}
		return (o = C.getElementById(i[2])) && (this[0] = o, this.length = 1), this
	}).prototype = T.fn, I = T(C);
	var $ = /^(?:parents|prev(?:Until|All))/,
		j = {
			children: !0,
			contents: !0,
			next: !0,
			prev: !0
		};

	function P(e, t) {
		for (;
			(e = e[t]) && 1 !== e.nodeType;);
		return e
	}
	T.fn.extend({
		has: function(e) {
			var t = T(e, this),
				n = t.length;
			return this.filter(function() {
				for (var e = 0; e < n; e++)
					if (T.contains(this, t[e])) return !0
			})
		},
		closest: function(e, t) {
			var n, i = 0,
				o = this.length,
				r = [],
				a = "string" != typeof e && T(e);
			if (!S.test(e))
				for (; i < o; i++)
					for (n = this[i]; n && n !== t; n = n.parentNode)
						if (n.nodeType < 11 && (a ? -1 < a.index(n) : 1 === n.nodeType && T.find.matchesSelector(n, e))) {
							r.push(n);
							break
						}
			return this.pushStack(1 < r.length ? T.uniqueSort(r) : r)
		},
		index: function(e) {
			return e ? "string" == typeof e ? o.call(T(e), this[0]) : o.call(this, e.jquery ? e[0] : e) : this[0] && this[0].parentNode ? this.first().prevAll().length : -1
		},
		add: function(e, t) {
			return this.pushStack(T.uniqueSort(T.merge(this.get(), T(e, t))))
		},
		addBack: function(e) {
			return this.add(null == e ? this.prevObject : this.prevObject.filter(e))
		}
	}), T.each({
		parent: function(e) {
			var t = e.parentNode;
			return t && 11 !== t.nodeType ? t : null
		},
		parents: function(e) {
			return _(e, "parentNode")
		},
		parentsUntil: function(e, t, n) {
			return _(e, "parentNode", n)
		},
		next: function(e) {
			return P(e, "nextSibling")
		},
		prev: function(e) {
			return P(e, "previousSibling")
		},
		nextAll: function(e) {
			return _(e, "nextSibling")
		},
		prevAll: function(e) {
			return _(e, "previousSibling")
		},
		nextUntil: function(e, t, n) {
			return _(e, "nextSibling", n)
		},
		prevUntil: function(e, t, n) {
			return _(e, "previousSibling", n)
		},
		siblings: function(e) {
			return x((e.parentNode || {}).firstChild, e)
		},
		children: function(e) {
			return x(e.firstChild)
		},
		contents: function(e) {
			return D(e, "iframe") ? e.contentDocument : (D(e, "template") && (e = e.content || e), T.merge([], e.childNodes))
		}
	}, function(i, o) {
		T.fn[i] = function(e, t) {
			var n = T.map(this, o, e);
			return "Until" !== i.slice(-5) && (t = e), t && "string" == typeof t && (n = T.filter(t, n)), 1 < this.length && (j[i] || T.uniqueSort(n), $.test(i) && n.reverse()), this.pushStack(n)
		}
	});
	var L = /[^\x20\t\r\n\f]+/g;

	function M(e) {
		return e
	}

	function H(e) {
		throw e
	}

	function R(e, t, n, i) {
		var o;
		try {
			e && T.isFunction(o = e.promise) ? o.call(e).done(t).fail(n) : e && T.isFunction(o = e.then) ? o.call(e, t, n) : t.apply(void 0, [e].slice(i))
		} catch (e) {
			n.apply(void 0, [e])
		}
	}
	T.Callbacks = function(i) {
		var e, n;
		i = "string" == typeof i ? (e = i, n = {}, T.each(e.match(L) || [], function(e, t) {
			n[t] = !0
		}), n) : T.extend({}, i);

		function o() {
			for (s = s || i.once, a = r = !0; c.length; u = -1)
				for (t = c.shift(); ++u < l.length;) !1 === l[u].apply(t[0], t[1]) && i.stopOnFalse && (u = l.length, t = !1);
			i.memory || (t = !1), r = !1, s && (l = t ? [] : "")
		}
		var r, t, a, s, l = [],
			c = [],
			u = -1,
			d = {
				add: function() {
					return l && (t && !r && (u = l.length - 1, c.push(t)), function n(e) {
						T.each(e, function(e, t) {
							T.isFunction(t) ? i.unique && d.has(t) || l.push(t) : t && t.length && "string" !== T.type(t) && n(t)
						})
					}(arguments), t && !r && o()), this
				},
				remove: function() {
					return T.each(arguments, function(e, t) {
						for (var n; - 1 < (n = T.inArray(t, l, n));) l.splice(n, 1), n <= u && u--
					}), this
				},
				has: function(e) {
					return e ? -1 < T.inArray(e, l) : 0 < l.length
				},
				empty: function() {
					return l = l && [], this
				},
				disable: function() {
					return s = c = [], l = t = "", this
				},
				disabled: function() {
					return !l
				},
				lock: function() {
					return s = c = [], t || r || (l = t = ""), this
				},
				locked: function() {
					return !!s
				},
				fireWith: function(e, t) {
					return s || (t = [e, (t = t || []).slice ? t.slice() : t], c.push(t), r || o()), this
				},
				fire: function() {
					return d.fireWith(this, arguments), this
				},
				fired: function() {
					return !!a
				}
			};
		return d
	}, T.extend({
		Deferred: function(e) {
			var r = [
					["notify", "progress", T.Callbacks("memory"), T.Callbacks("memory"), 2],
					["resolve", "done", T.Callbacks("once memory"), T.Callbacks("once memory"), 0, "resolved"],
					["reject", "fail", T.Callbacks("once memory"), T.Callbacks("once memory"), 1, "rejected"]
				],
				o = "pending",
				a = {
					state: function() {
						return o
					},
					always: function() {
						return s.done(arguments).fail(arguments), this
					},
					catch: function(e) {
						return a.then(null, e)
					},
					pipe: function() {
						var o = arguments;
						return T.Deferred(function(i) {
							T.each(r, function(e, t) {
								var n = T.isFunction(o[t[4]]) && o[t[4]];
								s[t[1]](function() {
									var e = n && n.apply(this, arguments);
									e && T.isFunction(e.promise) ? e.promise().progress(i.notify).done(i.resolve).fail(i.reject) : i[t[0] + "With"](this, n ? [e] : arguments)
								})
							}), o = null
						}).promise()
					},
					then: function(t, n, i) {
						var l = 0;

						function c(o, r, a, s) {
							return function() {
								function e() {
									var e, t;
									if (!(o < l)) {
										if ((e = a.apply(n, i)) === r.promise()) throw new TypeError("Thenable self-resolution");
										t = e && ("object" == typeof e || "function" == typeof e) && e.then, T.isFunction(t) ? s ? t.call(e, c(l, r, M, s), c(l, r, H, s)) : (l++, t.call(e, c(l, r, M, s), c(l, r, H, s), c(l, r, M, r.notifyWith))) : (a !== M && (n = void 0, i = [e]), (s || r.resolveWith)(n, i))
									}
								}
								var n = this,
									i = arguments,
									t = s ? e : function() {
										try {
											e()
										} catch (e) {
											T.Deferred.exceptionHook && T.Deferred.exceptionHook(e, t.stackTrace), l <= o + 1 && (a !== H && (n = void 0, i = [e]), r.rejectWith(n, i))
										}
									};
								o ? t() : (T.Deferred.getStackHook && (t.stackTrace = T.Deferred.getStackHook()), E.setTimeout(t))
							}
						}
						return T.Deferred(function(e) {
							r[0][3].add(c(0, e, T.isFunction(i) ? i : M, e.notifyWith)), r[1][3].add(c(0, e, T.isFunction(t) ? t : M)), r[2][3].add(c(0, e, T.isFunction(n) ? n : H))
						}).promise()
					},
					promise: function(e) {
						return null != e ? T.extend(e, a) : a
					}
				},
				s = {};
			return T.each(r, function(e, t) {
				var n = t[2],
					i = t[5];
				a[t[1]] = n.add, i && n.add(function() {
					o = i
				}, r[3 - e][2].disable, r[0][2].lock), n.add(t[3].fire), s[t[0]] = function() {
					return s[t[0] + "With"](this === s ? void 0 : this, arguments), this
				}, s[t[0] + "With"] = n.fireWith
			}), a.promise(s), e && e.call(s, s), s
		},
		when: function(e) {
			function t(t) {
				return function(e) {
					o[t] = this, r[t] = 1 < arguments.length ? s.call(arguments) : e, --n || a.resolveWith(o, r)
				}
			}
			var n = arguments.length,
				i = n,
				o = Array(i),
				r = s.call(arguments),
				a = T.Deferred();
			if (n <= 1 && (R(e, a.done(t(i)).resolve, a.reject, !n), "pending" === a.state() || T.isFunction(r[i] && r[i].then))) return a.then();
			for (; i--;) R(r[i], t(i), a.reject);
			return a.promise()
		}
	});
	var q = /^(Eval|Internal|Range|Reference|Syntax|Type|URI)Error$/;
	T.Deferred.exceptionHook = function(e, t) {
		E.console && E.console.warn && e && q.test(e.name) && E.console.warn("jQuery.Deferred exception: " + e.message, e.stack, t)
	}, T.readyException = function(e) {
		E.setTimeout(function() {
			throw e
		})
	};
	var F = T.Deferred();

	function W() {
		C.removeEventListener("DOMContentLoaded", W), E.removeEventListener("load", W), T.ready()
	}
	T.fn.ready = function(e) {
		return F.then(e).catch(function(e) {
			T.readyException(e)
		}), this
	}, T.extend({
		isReady: !1,
		readyWait: 1,
		ready: function(e) {
			(!0 === e ? --T.readyWait : T.isReady) || ((T.isReady = !0) !== e && 0 < --T.readyWait || F.resolveWith(C, [T]))
		}
	}), T.ready.then = F.then, "complete" === C.readyState || "loading" !== C.readyState && !C.documentElement.doScroll ? E.setTimeout(T.ready) : (C.addEventListener("DOMContentLoaded", W), E.addEventListener("load", W));

	function B(e) {
		return 1 === e.nodeType || 9 === e.nodeType || !+e.nodeType
	}
	var U = function(e, t, n, i, o, r, a) {
		var s = 0,
			l = e.length,
			c = null == n;
		if ("object" === T.type(n))
			for (s in o = !0, n) U(e, t, s, n[s], !0, r, a);
		else if (void 0 !== i && (o = !0, T.isFunction(i) || (a = !0), c && (t = a ? (t.call(e, i), null) : (c = t, function(e, t, n) {
				return c.call(T(e), n)
			})), t))
			for (; s < l; s++) t(e[s], n, a ? i : i.call(e[s], s, t(e[s], n)));
		return o ? e : c ? t.call(e) : l ? t(e[0], n) : r
	};

	function K() {
		this.expando = T.expando + K.uid++
	}
	K.uid = 1, K.prototype = {
		cache: function(e) {
			var t = e[this.expando];
			return t || (t = {}, B(e) && (e.nodeType ? e[this.expando] = t : Object.defineProperty(e, this.expando, {
				value: t,
				configurable: !0
			}))), t
		},
		set: function(e, t, n) {
			var i, o = this.cache(e);
			if ("string" == typeof t) o[T.camelCase(t)] = n;
			else
				for (i in t) o[T.camelCase(i)] = t[i];
			return o
		},
		get: function(e, t) {
			return void 0 === t ? this.cache(e) : e[this.expando] && e[this.expando][T.camelCase(t)]
		},
		access: function(e, t, n) {
			return void 0 === t || t && "string" == typeof t && void 0 === n ? this.get(e, t) : (this.set(e, t, n), void 0 !== n ? n : t)
		},
		remove: function(e, t) {
			var n, i = e[this.expando];
			if (void 0 !== i) {
				if (void 0 !== t) {
					n = (t = Array.isArray(t) ? t.map(T.camelCase) : (t = T.camelCase(t)) in i ? [t] : t.match(L) || []).length;
					for (; n--;) delete i[t[n]]
				}
				void 0 !== t && !T.isEmptyObject(i) || (e.nodeType ? e[this.expando] = void 0 : delete e[this.expando])
			}
		},
		hasData: function(e) {
			var t = e[this.expando];
			return void 0 !== t && !T.isEmptyObject(t)
		}
	};
	var V = new K,
		X = new K,
		Y = /^(?:\{[\w\W]*\}|\[[\w\W]*\])$/,
		z = /[A-Z]/g;

	function Q(e, t, n) {
		var i, o;
		if (void 0 === n && 1 === e.nodeType)
			if (i = "data-" + t.replace(z, "-$&").toLowerCase(), "string" == typeof(n = e.getAttribute(i))) {
				try {
					n = "true" === (o = n) || "false" !== o && ("null" === o ? null : o === +o + "" ? +o : Y.test(o) ? JSON.parse(o) : o)
				} catch (e) {}
				X.set(e, t, n)
			} else n = void 0;
		return n
	}
	T.extend({
		hasData: function(e) {
			return X.hasData(e) || V.hasData(e)
		},
		data: function(e, t, n) {
			return X.access(e, t, n)
		},
		removeData: function(e, t) {
			X.remove(e, t)
		},
		_data: function(e, t, n) {
			return V.access(e, t, n)
		},
		_removeData: function(e, t) {
			V.remove(e, t)
		}
	}), T.fn.extend({
		data: function(n, e) {
			var t, i, o, r = this[0],
				a = r && r.attributes;
			if (void 0 !== n) return "object" == typeof n ? this.each(function() {
				X.set(this, n)
			}) : U(this, function(e) {
				var t;
				if (r && void 0 === e) {
					if (void 0 !== (t = X.get(r, n))) return t;
					if (void 0 !== (t = Q(r, n))) return t
				} else this.each(function() {
					X.set(this, n, e)
				})
			}, null, e, 1 < arguments.length, null, !0);
			if (this.length && (o = X.get(r), 1 === r.nodeType && !V.get(r, "hasDataAttrs"))) {
				for (t = a.length; t--;) a[t] && (0 === (i = a[t].name).indexOf("data-") && (i = T.camelCase(i.slice(5)), Q(r, i, o[i])));
				V.set(r, "hasDataAttrs", !0)
			}
			return o
		},
		removeData: function(e) {
			return this.each(function() {
				X.remove(this, e)
			})
		}
	}), T.extend({
		queue: function(e, t, n) {
			var i;
			if (e) return t = (t || "fx") + "queue", i = V.get(e, t), n && (!i || Array.isArray(n) ? i = V.access(e, t, T.makeArray(n)) : i.push(n)), i || []
		},
		dequeue: function(e, t) {
			t = t || "fx";
			var n = T.queue(e, t),
				i = n.length,
				o = n.shift(),
				r = T._queueHooks(e, t);
			"inprogress" === o && (o = n.shift(), i--), o && ("fx" === t && n.unshift("inprogress"), delete r.stop, o.call(e, function() {
				T.dequeue(e, t)
			}, r)), !i && r && r.empty.fire()
		},
		_queueHooks: function(e, t) {
			var n = t + "queueHooks";
			return V.get(e, n) || V.access(e, n, {
				empty: T.Callbacks("once memory").add(function() {
					V.remove(e, [t + "queue", n])
				})
			})
		}
	}), T.fn.extend({
		queue: function(t, n) {
			var e = 2;
			return "string" != typeof t && (n = t, t = "fx", e--), arguments.length < e ? T.queue(this[0], t) : void 0 === n ? this : this.each(function() {
				var e = T.queue(this, t, n);
				T._queueHooks(this, t), "fx" === t && "inprogress" !== e[0] && T.dequeue(this, t)
			})
		},
		dequeue: function(e) {
			return this.each(function() {
				T.dequeue(this, e)
			})
		},
		clearQueue: function(e) {
			return this.queue(e || "fx", [])
		},
		promise: function(e, t) {
			function n() {
				--o || r.resolveWith(a, [a])
			}
			var i, o = 1,
				r = T.Deferred(),
				a = this,
				s = this.length;
			for ("string" != typeof e && (t = e, e = void 0), e = e || "fx"; s--;)(i = V.get(a[s], e + "queueHooks")) && i.empty && (o++, i.empty.add(n));
			return n(), r.promise(t)
		}
	});

	function G(e, t, n, i) {
		var o, r, a = {};
		for (r in t) a[r] = e.style[r], e.style[r] = t[r];
		for (r in o = n.apply(e, i || []), t) e.style[r] = a[r];
		return o
	}
	var J = /[+-]?(?:\d*\.|)\d+(?:[eE][+-]?\d+|)/.source,
		Z = new RegExp("^(?:([+-])=|)(" + J + ")([a-z%]*)$", "i"),
		ee = ["Top", "Right", "Bottom", "Left"],
		te = function(e, t) {
			return "none" === (e = t || e).style.display || "" === e.style.display && T.contains(e.ownerDocument, e) && "none" === T.css(e, "display")
		};

	function ne(e, t, n, i) {
		var o, r = 1,
			a = 20,
			s = i ? function() {
				return i.cur()
			} : function() {
				return T.css(e, t, "")
			},
			l = s(),
			c = n && n[3] || (T.cssNumber[t] ? "" : "px"),
			u = (T.cssNumber[t] || "px" !== c && +l) && Z.exec(T.css(e, t));
		if (u && u[3] !== c)
			for (c = c || u[3], n = n || [], u = +l || 1; u /= r = r || ".5", T.style(e, t, u + c), r !== (r = s() / l) && 1 !== r && --a;);
		return n && (u = +u || +l || 0, o = n[1] ? u + (n[1] + 1) * n[2] : +n[2], i && (i.unit = c, i.start = u, i.end = o)), o
	}
	var ie = {};

	function oe(e, t) {
		for (var n, i, o = [], r = 0, a = e.length; r < a; r++)(i = e[r]).style && (n = i.style.display, t ? ("none" === n && (o[r] = V.get(i, "display") || null, o[r] || (i.style.display = "")), "" === i.style.display && te(i) && (o[r] = (d = c = l = void 0, c = (s = i).ownerDocument, u = s.nodeName, (d = ie[u]) || (l = c.body.appendChild(c.createElement(u)), d = T.css(l, "display"), l.parentNode.removeChild(l), "none" === d && (d = "block"), ie[u] = d)))) : "none" !== n && (o[r] = "none", V.set(i, "display", n)));
		var s, l, c, u, d;
		for (r = 0; r < a; r++) null != o[r] && (e[r].style.display = o[r]);
		return e
	}
	T.fn.extend({
		show: function() {
			return oe(this, !0)
		},
		hide: function() {
			return oe(this)
		},
		toggle: function(e) {
			return "boolean" == typeof e ? e ? this.show() : this.hide() : this.each(function() {
				te(this) ? T(this).show() : T(this).hide()
			})
		}
	});
	var re = /^(?:checkbox|radio)$/i,
		ae = /<([a-z][^\/\0>\x20\t\r\n\f]+)/i,
		se = /^$|\/(?:java|ecma)script/i,
		le = {
			option: [1, "<select multiple='multiple'>", "</select>"],
			thead: [1, "<table>", "</table>"],
			col: [2, "<table><colgroup>", "</colgroup></table>"],
			tr: [2, "<table><tbody>", "</tbody></table>"],
			td: [3, "<table><tbody><tr>", "</tr></tbody></table>"],
			_default: [0, "", ""]
		};

	function ce(e, t) {
		var n;
		return n = void 0 !== e.getElementsByTagName ? e.getElementsByTagName(t || "*") : void 0 !== e.querySelectorAll ? e.querySelectorAll(t || "*") : [], void 0 === t || t && D(e, t) ? T.merge([e], n) : n
	}

	function ue(e, t) {
		for (var n = 0, i = e.length; n < i; n++) V.set(e[n], "globalEval", !t || V.get(t[n], "globalEval"))
	}
	le.optgroup = le.option, le.tbody = le.tfoot = le.colgroup = le.caption = le.thead, le.th = le.td;
	var de, fe, he = /<|&#?\w+;/;

	function pe(e, t, n, i, o) {
		for (var r, a, s, l, c, u, d = t.createDocumentFragment(), f = [], h = 0, p = e.length; h < p; h++)
			if ((r = e[h]) || 0 === r)
				if ("object" === T.type(r)) T.merge(f, r.nodeType ? [r] : r);
				else if (he.test(r)) {
			for (a = a || d.appendChild(t.createElement("div")), s = (ae.exec(r) || ["", ""])[1].toLowerCase(), l = le[s] || le._default, a.innerHTML = l[1] + T.htmlPrefilter(r) + l[2], u = l[0]; u--;) a = a.lastChild;
			T.merge(f, a.childNodes), (a = d.firstChild).textContent = ""
		} else f.push(t.createTextNode(r));
		for (d.textContent = "", h = 0; r = f[h++];)
			if (i && -1 < T.inArray(r, i)) o && o.push(r);
			else if (c = T.contains(r.ownerDocument, r), a = ce(d.appendChild(r), "script"), c && ue(a), n)
			for (u = 0; r = a[u++];) se.test(r.type || "") && n.push(r);
		return d
	}
	de = C.createDocumentFragment().appendChild(C.createElement("div")), (fe = C.createElement("input")).setAttribute("type", "radio"), fe.setAttribute("checked", "checked"), fe.setAttribute("name", "t"), de.appendChild(fe), g.checkClone = de.cloneNode(!0).cloneNode(!0).lastChild.checked, de.innerHTML = "<textarea>x</textarea>", g.noCloneChecked = !!de.cloneNode(!0).lastChild.defaultValue;
	var me = C.documentElement,
		ge = /^key/,
		ve = /^(?:mouse|pointer|contextmenu|drag|drop)|click/,
		ye = /^([^.]*)(?:\.(.+)|)/;

	function be() {
		return !0
	}

	function we() {
		return !1
	}

	function _e() {
		try {
			return C.activeElement
		} catch (e) {}
	}

	function xe(e, t, n, i, o, r) {
		var a, s;
		if ("object" == typeof t) {
			for (s in "string" != typeof n && (i = i || n, n = void 0), t) xe(e, s, n, i, t[s], r);
			return e
		}
		if (null == i && null == o ? (o = n, i = n = void 0) : null == o && ("string" == typeof n ? (o = i, i = void 0) : (o = i, i = n, n = void 0)), !1 === o) o = we;
		else if (!o) return e;
		return 1 === r && (a = o, (o = function(e) {
			return T().off(e), a.apply(this, arguments)
		}).guid = a.guid || (a.guid = T.guid++)), e.each(function() {
			T.event.add(this, t, o, i, n)
		})
	}
	T.event = {
		global: {},
		add: function(t, e, n, i, o) {
			var r, a, s, l, c, u, d, f, h, p, m, g = V.get(t);
			if (g)
				for (n.handler && (n = (r = n).handler, o = r.selector), o && T.find.matchesSelector(me, o), n.guid || (n.guid = T.guid++), (l = g.events) || (l = g.events = {}), (a = g.handle) || (a = g.handle = function(e) {
						return void 0 !== T && T.event.triggered !== e.type ? T.event.dispatch.apply(t, arguments) : void 0
					}), c = (e = (e || "").match(L) || [""]).length; c--;) h = m = (s = ye.exec(e[c]) || [])[1], p = (s[2] || "").split(".").sort(), h && (d = T.event.special[h] || {}, h = (o ? d.delegateType : d.bindType) || h, d = T.event.special[h] || {}, u = T.extend({
					type: h,
					origType: m,
					data: i,
					handler: n,
					guid: n.guid,
					selector: o,
					needsContext: o && T.expr.match.needsContext.test(o),
					namespace: p.join(".")
				}, r), (f = l[h]) || ((f = l[h] = []).delegateCount = 0, d.setup && !1 !== d.setup.call(t, i, p, a) || t.addEventListener && t.addEventListener(h, a)), d.add && (d.add.call(t, u), u.handler.guid || (u.handler.guid = n.guid)), o ? f.splice(f.delegateCount++, 0, u) : f.push(u), T.event.global[h] = !0)
		},
		remove: function(e, t, n, i, o) {
			var r, a, s, l, c, u, d, f, h, p, m, g = V.hasData(e) && V.get(e);
			if (g && (l = g.events)) {
				for (c = (t = (t || "").match(L) || [""]).length; c--;)
					if (h = m = (s = ye.exec(t[c]) || [])[1], p = (s[2] || "").split(".").sort(), h) {
						for (d = T.event.special[h] || {}, f = l[h = (i ? d.delegateType : d.bindType) || h] || [], s = s[2] && new RegExp("(^|\\.)" + p.join("\\.(?:.*\\.|)") + "(\\.|$)"), a = r = f.length; r--;) u = f[r], !o && m !== u.origType || n && n.guid !== u.guid || s && !s.test(u.namespace) || i && i !== u.selector && ("**" !== i || !u.selector) || (f.splice(r, 1), u.selector && f.delegateCount--, d.remove && d.remove.call(e, u));
						a && !f.length && (d.teardown && !1 !== d.teardown.call(e, p, g.handle) || T.removeEvent(e, h, g.handle), delete l[h])
					} else
						for (h in l) T.event.remove(e, h + t[c], n, i, !0);
				T.isEmptyObject(l) && V.remove(e, "handle events")
			}
		},
		dispatch: function(e) {
			var t, n, i, o, r, a, s = T.event.fix(e),
				l = new Array(arguments.length),
				c = (V.get(this, "events") || {})[s.type] || [],
				u = T.event.special[s.type] || {};
			for (l[0] = s, t = 1; t < arguments.length; t++) l[t] = arguments[t];
			if (s.delegateTarget = this, !u.preDispatch || !1 !== u.preDispatch.call(this, s)) {
				for (a = T.event.handlers.call(this, s, c), t = 0;
					(o = a[t++]) && !s.isPropagationStopped();)
					for (s.currentTarget = o.elem, n = 0;
						(r = o.handlers[n++]) && !s.isImmediatePropagationStopped();) s.rnamespace && !s.rnamespace.test(r.namespace) || (s.handleObj = r, s.data = r.data, void 0 !== (i = ((T.event.special[r.origType] || {}).handle || r.handler).apply(o.elem, l)) && !1 === (s.result = i) && (s.preventDefault(), s.stopPropagation()));
				return u.postDispatch && u.postDispatch.call(this, s), s.result
			}
		},
		handlers: function(e, t) {
			var n, i, o, r, a, s = [],
				l = t.delegateCount,
				c = e.target;
			if (l && c.nodeType && !("click" === e.type && 1 <= e.button))
				for (; c !== this; c = c.parentNode || this)
					if (1 === c.nodeType && ("click" !== e.type || !0 !== c.disabled)) {
						for (r = [], a = {}, n = 0; n < l; n++) void 0 === a[o = (i = t[n]).selector + " "] && (a[o] = i.needsContext ? -1 < T(o, this).index(c) : T.find(o, this, null, [c]).length), a[o] && r.push(i);
						r.length && s.push({
							elem: c,
							handlers: r
						})
					}
			return c = this, l < t.length && s.push({
				elem: c,
				handlers: t.slice(l)
			}), s
		},
		addProp: function(t, e) {
			Object.defineProperty(T.Event.prototype, t, {
				enumerable: !0,
				configurable: !0,
				get: T.isFunction(e) ? function() {
					if (this.originalEvent) return e(this.originalEvent)
				} : function() {
					if (this.originalEvent) return this.originalEvent[t]
				},
				set: function(e) {
					Object.defineProperty(this, t, {
						enumerable: !0,
						configurable: !0,
						writable: !0,
						value: e
					})
				}
			})
		},
		fix: function(e) {
			return e[T.expando] ? e : new T.Event(e)
		},
		special: {
			load: {
				noBubble: !0
			},
			focus: {
				trigger: function() {
					if (this !== _e() && this.focus) return this.focus(), !1
				},
				delegateType: "focusin"
			},
			blur: {
				trigger: function() {
					if (this === _e() && this.blur) return this.blur(), !1
				},
				delegateType: "focusout"
			},
			click: {
				trigger: function() {
					if ("checkbox" === this.type && this.click && D(this, "input")) return this.click(), !1
				},
				_default: function(e) {
					return D(e.target, "a")
				}
			},
			beforeunload: {
				postDispatch: function(e) {
					void 0 !== e.result && e.originalEvent && (e.originalEvent.returnValue = e.result)
				}
			}
		}
	}, T.removeEvent = function(e, t, n) {
		e.removeEventListener && e.removeEventListener(t, n)
	}, T.Event = function(e, t) {
		return this instanceof T.Event ? (e && e.type ? (this.originalEvent = e, this.type = e.type, this.isDefaultPrevented = e.defaultPrevented || void 0 === e.defaultPrevented && !1 === e.returnValue ? be : we, this.target = e.target && 3 === e.target.nodeType ? e.target.parentNode : e.target, this.currentTarget = e.currentTarget, this.relatedTarget = e.relatedTarget) : this.type = e, t && T.extend(this, t), this.timeStamp = e && e.timeStamp || T.now(), void(this[T.expando] = !0)) : new T.Event(e, t)
	}, T.Event.prototype = {
		constructor: T.Event,
		isDefaultPrevented: we,
		isPropagationStopped: we,
		isImmediatePropagationStopped: we,
		isSimulated: !1,
		preventDefault: function() {
			var e = this.originalEvent;
			this.isDefaultPrevented = be, e && !this.isSimulated && e.preventDefault()
		},
		stopPropagation: function() {
			var e = this.originalEvent;
			this.isPropagationStopped = be, e && !this.isSimulated && e.stopPropagation()
		},
		stopImmediatePropagation: function() {
			var e = this.originalEvent;
			this.isImmediatePropagationStopped = be, e && !this.isSimulated && e.stopImmediatePropagation(), this.stopPropagation()
		}
	}, T.each({
		altKey: !0,
		bubbles: !0,
		cancelable: !0,
		changedTouches: !0,
		ctrlKey: !0,
		detail: !0,
		eventPhase: !0,
		metaKey: !0,
		pageX: !0,
		pageY: !0,
		shiftKey: !0,
		view: !0,
		char: !0,
		charCode: !0,
		key: !0,
		keyCode: !0,
		button: !0,
		buttons: !0,
		clientX: !0,
		clientY: !0,
		offsetX: !0,
		offsetY: !0,
		pointerId: !0,
		pointerType: !0,
		screenX: !0,
		screenY: !0,
		targetTouches: !0,
		toElement: !0,
		touches: !0,
		which: function(e) {
			var t = e.button;
			return null == e.which && ge.test(e.type) ? null != e.charCode ? e.charCode : e.keyCode : !e.which && void 0 !== t && ve.test(e.type) ? 1 & t ? 1 : 2 & t ? 3 : 4 & t ? 2 : 0 : e.which
		}
	}, T.event.addProp), T.each({
		mouseenter: "mouseover",
		mouseleave: "mouseout",
		pointerenter: "pointerover",
		pointerleave: "pointerout"
	}, function(e, o) {
		T.event.special[e] = {
			delegateType: o,
			bindType: o,
			handle: function(e) {
				var t, n = e.relatedTarget,
					i = e.handleObj;
				return n && (n === this || T.contains(this, n)) || (e.type = i.origType, t = i.handler.apply(this, arguments), e.type = o), t
			}
		}
	}), T.fn.extend({
		on: function(e, t, n, i) {
			return xe(this, e, t, n, i)
		},
		one: function(e, t, n, i) {
			return xe(this, e, t, n, i, 1)
		},
		off: function(e, t, n) {
			var i, o;
			if (e && e.preventDefault && e.handleObj) return i = e.handleObj, T(e.delegateTarget).off(i.namespace ? i.origType + "." + i.namespace : i.origType, i.selector, i.handler), this;
			if ("object" != typeof e) return !1 !== t && "function" != typeof t || (n = t, t = void 0), !1 === n && (n = we), this.each(function() {
				T.event.remove(this, e, n, t)
			});
			for (o in e) this.off(o, t, e[o]);
			return this
		}
	});
	var Ee = /<(?!area|br|col|embed|hr|img|input|link|meta|param)(([a-z][^\/\0>\x20\t\r\n\f]*)[^>]*)\/>/gi,
		Ce = /<script|<style|<link/i,
		Te = /checked\s*(?:[^=]|=\s*.checked.)/i,
		Se = /^true\/(.*)/,
		De = /^\s*<!(?:\[CDATA\[|--)|(?:\]\]|--)>\s*$/g;

	function Ae(e, t) {
		return D(e, "table") && D(11 !== t.nodeType ? t : t.firstChild, "tr") && T(">tbody", e)[0] || e
	}

	function ke(e) {
		return e.type = (null !== e.getAttribute("type")) + "/" + e.type, e
	}

	function Ne(e) {
		var t = Se.exec(e.type);
		return t ? e.type = t[1] : e.removeAttribute("type"), e
	}

	function Ie(e, t) {
		var n, i, o, r, a, s, l, c;
		if (1 === t.nodeType) {
			if (V.hasData(e) && (r = V.access(e), a = V.set(t, r), c = r.events))
				for (o in delete a.handle, a.events = {}, c)
					for (n = 0, i = c[o].length; n < i; n++) T.event.add(t, o, c[o][n]);
			X.hasData(e) && (s = X.access(e), l = T.extend({}, s), X.set(t, l))
		}
	}

	function Oe(n, i, o, r) {
		i = m.apply([], i);
		var e, t, a, s, l, c, u = 0,
			d = n.length,
			f = d - 1,
			h = i[0],
			p = T.isFunction(h);
		if (p || 1 < d && "string" == typeof h && !g.checkClone && Te.test(h)) return n.each(function(e) {
			var t = n.eq(e);
			p && (i[0] = h.call(this, e, t.html())), Oe(t, i, o, r)
		});
		if (d && (t = (e = pe(i, n[0].ownerDocument, !1, n, r)).firstChild, 1 === e.childNodes.length && (e = t), t || r)) {
			for (s = (a = T.map(ce(e, "script"), ke)).length; u < d; u++) l = e, u !== f && (l = T.clone(l, !0, !0), s && T.merge(a, ce(l, "script"))), o.call(n[u], l, u);
			if (s)
				for (c = a[a.length - 1].ownerDocument, T.map(a, Ne), u = 0; u < s; u++) l = a[u], se.test(l.type || "") && !V.access(l, "globalEval") && T.contains(c, l) && (l.src ? T._evalUrl && T._evalUrl(l.src) : v(l.textContent.replace(De, ""), c))
		}
		return n
	}

	function $e(e, t, n) {
		for (var i, o = t ? T.filter(t, e) : e, r = 0; null != (i = o[r]); r++) n || 1 !== i.nodeType || T.cleanData(ce(i)), i.parentNode && (n && T.contains(i.ownerDocument, i) && ue(ce(i, "script")), i.parentNode.removeChild(i));
		return e
	}
	T.extend({
		htmlPrefilter: function(e) {
			return e.replace(Ee, "<$1></$2>")
		},
		clone: function(e, t, n) {
			var i, o, r, a, s, l, c, u = e.cloneNode(!0),
				d = T.contains(e.ownerDocument, e);
			if (!(g.noCloneChecked || 1 !== e.nodeType && 11 !== e.nodeType || T.isXMLDoc(e)))
				for (a = ce(u), i = 0, o = (r = ce(e)).length; i < o; i++) s = r[i], l = a[i], "input" === (c = l.nodeName.toLowerCase()) && re.test(s.type) ? l.checked = s.checked : "input" !== c && "textarea" !== c || (l.defaultValue = s.defaultValue);
			if (t)
				if (n)
					for (r = r || ce(e), a = a || ce(u), i = 0, o = r.length; i < o; i++) Ie(r[i], a[i]);
				else Ie(e, u);
			return 0 < (a = ce(u, "script")).length && ue(a, !d && ce(e, "script")), u
		},
		cleanData: function(e) {
			for (var t, n, i, o = T.event.special, r = 0; void 0 !== (n = e[r]); r++)
				if (B(n)) {
					if (t = n[V.expando]) {
						if (t.events)
							for (i in t.events) o[i] ? T.event.remove(n, i) : T.removeEvent(n, i, t.handle);
						n[V.expando] = void 0
					}
					n[X.expando] && (n[X.expando] = void 0)
				}
		}
	}), T.fn.extend({
		detach: function(e) {
			return $e(this, e, !0)
		},
		remove: function(e) {
			return $e(this, e)
		},
		text: function(e) {
			return U(this, function(e) {
				return void 0 === e ? T.text(this) : this.empty().each(function() {
					1 !== this.nodeType && 11 !== this.nodeType && 9 !== this.nodeType || (this.textContent = e)
				})
			}, null, e, arguments.length)
		},
		append: function() {
			return Oe(this, arguments, function(e) {
				1 !== this.nodeType && 11 !== this.nodeType && 9 !== this.nodeType || Ae(this, e).appendChild(e)
			})
		},
		prepend: function() {
			return Oe(this, arguments, function(e) {
				if (1 === this.nodeType || 11 === this.nodeType || 9 === this.nodeType) {
					var t = Ae(this, e);
					t.insertBefore(e, t.firstChild)
				}
			})
		},
		before: function() {
			return Oe(this, arguments, function(e) {
				this.parentNode && this.parentNode.insertBefore(e, this)
			})
		},
		after: function() {
			return Oe(this, arguments, function(e) {
				this.parentNode && this.parentNode.insertBefore(e, this.nextSibling)
			})
		},
		empty: function() {
			for (var e, t = 0; null != (e = this[t]); t++) 1 === e.nodeType && (T.cleanData(ce(e, !1)), e.textContent = "");
			return this
		},
		clone: function(e, t) {
			return e = null != e && e, t = null == t ? e : t, this.map(function() {
				return T.clone(this, e, t)
			})
		},
		html: function(e) {
			return U(this, function(e) {
				var t = this[0] || {},
					n = 0,
					i = this.length;
				if (void 0 === e && 1 === t.nodeType) return t.innerHTML;
				if ("string" == typeof e && !Ce.test(e) && !le[(ae.exec(e) || ["", ""])[1].toLowerCase()]) {
					e = T.htmlPrefilter(e);
					try {
						for (; n < i; n++) 1 === (t = this[n] || {}).nodeType && (T.cleanData(ce(t, !1)), t.innerHTML = e);
						t = 0
					} catch (e) {}
				}
				t && this.empty().append(e)
			}, null, e, arguments.length)
		},
		replaceWith: function() {
			var n = [];
			return Oe(this, arguments, function(e) {
				var t = this.parentNode;
				T.inArray(this, n) < 0 && (T.cleanData(ce(this)), t && t.replaceChild(e, this))
			}, n)
		}
	}), T.each({
		appendTo: "append",
		prependTo: "prepend",
		insertBefore: "before",
		insertAfter: "after",
		replaceAll: "replaceWith"
	}, function(e, a) {
		T.fn[e] = function(e) {
			for (var t, n = [], i = T(e), o = i.length - 1, r = 0; r <= o; r++) t = r === o ? this : this.clone(!0), T(i[r])[a](t), l.apply(n, t.get());
			return this.pushStack(n)
		}
	});
	var je, Pe, Le, Me, He, Re, qe = /^margin/,
		Fe = new RegExp("^(" + J + ")(?!px)[a-z%]+$", "i"),
		We = function(e) {
			var t = e.ownerDocument.defaultView;
			return t && t.opener || (t = E), t.getComputedStyle(e)
		};

	function Be() {
		if (Re) {
			Re.style.cssText = "box-sizing:border-box;position:relative;display:block;margin:auto;border:1px;padding:1px;top:1%;width:50%", Re.innerHTML = "", me.appendChild(He);
			var e = E.getComputedStyle(Re);
			je = "1%" !== e.top, Me = "2px" === e.marginLeft, Pe = "4px" === e.width, Re.style.marginRight = "50%", Le = "4px" === e.marginRight, me.removeChild(He), Re = null
		}
	}

	function Ue(e, t, n) {
		var i, o, r, a, s = e.style;
		return (n = n || We(e)) && ("" !== (a = n.getPropertyValue(t) || n[t]) || T.contains(e.ownerDocument, e) || (a = T.style(e, t)), !g.pixelMarginRight() && Fe.test(a) && qe.test(t) && (i = s.width, o = s.minWidth, r = s.maxWidth, s.minWidth = s.maxWidth = s.width = a, a = n.width, s.width = i, s.minWidth = o, s.maxWidth = r)), void 0 !== a ? a + "" : a
	}

	function Ke(e, t) {
		return {
			get: function() {
				return e() ? void delete this.get : (this.get = t).apply(this, arguments)
			}
		}
	}
	He = C.createElement("div"), (Re = C.createElement("div")).style && (Re.style.backgroundClip = "content-box", Re.cloneNode(!0).style.backgroundClip = "", g.clearCloneStyle = "content-box" === Re.style.backgroundClip, He.style.cssText = "border:0;width:8px;height:0;top:0;left:-9999px;padding:0;margin-top:1px;position:absolute", He.appendChild(Re), T.extend(g, {
		pixelPosition: function() {
			return Be(), je
		},
		boxSizingReliable: function() {
			return Be(), Pe
		},
		pixelMarginRight: function() {
			return Be(), Le
		},
		reliableMarginLeft: function() {
			return Be(), Me
		}
	}));
	var Ve = /^(none|table(?!-c[ea]).+)/,
		Xe = /^--/,
		Ye = {
			position: "absolute",
			visibility: "hidden",
			display: "block"
		},
		ze = {
			letterSpacing: "0",
			fontWeight: "400"
		},
		Qe = ["Webkit", "Moz", "ms"],
		Ge = C.createElement("div").style;

	function Je(e) {
		var t = T.cssProps[e];
		return t = t || (T.cssProps[e] = function(e) {
			if (e in Ge) return e;
			for (var t = e[0].toUpperCase() + e.slice(1), n = Qe.length; n--;)
				if ((e = Qe[n] + t) in Ge) return e
		}(e) || e)
	}

	function Ze(e, t, n) {
		var i = Z.exec(t);
		return i ? Math.max(0, i[2] - (n || 0)) + (i[3] || "px") : t
	}

	function et(e, t, n, i, o) {
		var r, a = 0;
		for (r = n === (i ? "border" : "content") ? 4 : "width" === t ? 1 : 0; r < 4; r += 2) "margin" === n && (a += T.css(e, n + ee[r], !0, o)), i ? ("content" === n && (a -= T.css(e, "padding" + ee[r], !0, o)), "margin" !== n && (a -= T.css(e, "border" + ee[r] + "Width", !0, o))) : (a += T.css(e, "padding" + ee[r], !0, o), "padding" !== n && (a += T.css(e, "border" + ee[r] + "Width", !0, o)));
		return a
	}

	function tt(e, t, n) {
		var i, o = We(e),
			r = Ue(e, t, o),
			a = "border-box" === T.css(e, "boxSizing", !1, o);
		return Fe.test(r) ? r : (i = a && (g.boxSizingReliable() || r === e.style[t]), "auto" === r && (r = e["offset" + t[0].toUpperCase() + t.slice(1)]), (r = parseFloat(r) || 0) + et(e, t, n || (a ? "border" : "content"), i, o) + "px")
	}

	function nt(e, t, n, i, o) {
		return new nt.prototype.init(e, t, n, i, o)
	}
	T.extend({
		cssHooks: {
			opacity: {
				get: function(e, t) {
					if (t) {
						var n = Ue(e, "opacity");
						return "" === n ? "1" : n
					}
				}
			}
		},
		cssNumber: {
			animationIterationCount: !0,
			columnCount: !0,
			fillOpacity: !0,
			flexGrow: !0,
			flexShrink: !0,
			fontWeight: !0,
			lineHeight: !0,
			opacity: !0,
			order: !0,
			orphans: !0,
			widows: !0,
			zIndex: !0,
			zoom: !0
		},
		cssProps: {
			float: "cssFloat"
		},
		style: function(e, t, n, i) {
			if (e && 3 !== e.nodeType && 8 !== e.nodeType && e.style) {
				var o, r, a, s = T.camelCase(t),
					l = Xe.test(t),
					c = e.style;
				return l || (t = Je(s)), a = T.cssHooks[t] || T.cssHooks[s], void 0 === n ? a && "get" in a && void 0 !== (o = a.get(e, !1, i)) ? o : c[t] : ("string" === (r = typeof n) && (o = Z.exec(n)) && o[1] && (n = ne(e, t, o), r = "number"), void(null != n && n == n && ("number" === r && (n += o && o[3] || (T.cssNumber[s] ? "" : "px")), g.clearCloneStyle || "" !== n || 0 !== t.indexOf("background") || (c[t] = "inherit"), a && "set" in a && void 0 === (n = a.set(e, n, i)) || (l ? c.setProperty(t, n) : c[t] = n))))
			}
		},
		css: function(e, t, n, i) {
			var o, r, a, s = T.camelCase(t);
			return Xe.test(t) || (t = Je(s)), (a = T.cssHooks[t] || T.cssHooks[s]) && "get" in a && (o = a.get(e, !0, n)), void 0 === o && (o = Ue(e, t, i)), "normal" === o && t in ze && (o = ze[t]), "" === n || n ? (r = parseFloat(o), !0 === n || isFinite(r) ? r || 0 : o) : o
		}
	}), T.each(["height", "width"], function(e, a) {
		T.cssHooks[a] = {
			get: function(e, t, n) {
				if (t) return !Ve.test(T.css(e, "display")) || e.getClientRects().length && e.getBoundingClientRect().width ? tt(e, a, n) : G(e, Ye, function() {
					return tt(e, a, n)
				})
			},
			set: function(e, t, n) {
				var i, o = n && We(e),
					r = n && et(e, a, n, "border-box" === T.css(e, "boxSizing", !1, o), o);
				return r && (i = Z.exec(t)) && "px" !== (i[3] || "px") && (e.style[a] = t, t = T.css(e, a)), Ze(0, t, r)
			}
		}
	}), T.cssHooks.marginLeft = Ke(g.reliableMarginLeft, function(e, t) {
		if (t) return (parseFloat(Ue(e, "marginLeft")) || e.getBoundingClientRect().left - G(e, {
			marginLeft: 0
		}, function() {
			return e.getBoundingClientRect().left
		})) + "px"
	}), T.each({
		margin: "",
		padding: "",
		border: "Width"
	}, function(o, r) {
		T.cssHooks[o + r] = {
			expand: function(e) {
				for (var t = 0, n = {}, i = "string" == typeof e ? e.split(" ") : [e]; t < 4; t++) n[o + ee[t] + r] = i[t] || i[t - 2] || i[0];
				return n
			}
		}, qe.test(o) || (T.cssHooks[o + r].set = Ze)
	}), T.fn.extend({
		css: function(e, t) {
			return U(this, function(e, t, n) {
				var i, o, r = {},
					a = 0;
				if (Array.isArray(t)) {
					for (i = We(e), o = t.length; a < o; a++) r[t[a]] = T.css(e, t[a], !1, i);
					return r
				}
				return void 0 !== n ? T.style(e, t, n) : T.css(e, t)
			}, e, t, 1 < arguments.length)
		}
	}), ((T.Tween = nt).prototype = {
		constructor: nt,
		init: function(e, t, n, i, o, r) {
			this.elem = e, this.prop = n, this.easing = o || T.easing._default, this.options = t, this.start = this.now = this.cur(), this.end = i, this.unit = r || (T.cssNumber[n] ? "" : "px")
		},
		cur: function() {
			var e = nt.propHooks[this.prop];
			return e && e.get ? e.get(this) : nt.propHooks._default.get(this)
		},
		run: function(e) {
			var t, n = nt.propHooks[this.prop];
			return this.options.duration ? this.pos = t = T.easing[this.easing](e, this.options.duration * e, 0, 1, this.options.duration) : this.pos = t = e, this.now = (this.end - this.start) * t + this.start, this.options.step && this.options.step.call(this.elem, this.now, this), n && n.set ? n.set(this) : nt.propHooks._default.set(this), this
		}
	}).init.prototype = nt.prototype, (nt.propHooks = {
		_default: {
			get: function(e) {
				var t;
				return 1 !== e.elem.nodeType || null != e.elem[e.prop] && null == e.elem.style[e.prop] ? e.elem[e.prop] : (t = T.css(e.elem, e.prop, "")) && "auto" !== t ? t : 0
			},
			set: function(e) {
				T.fx.step[e.prop] ? T.fx.step[e.prop](e) : 1 !== e.elem.nodeType || null == e.elem.style[T.cssProps[e.prop]] && !T.cssHooks[e.prop] ? e.elem[e.prop] = e.now : T.style(e.elem, e.prop, e.now + e.unit)
			}
		}
	}).scrollTop = nt.propHooks.scrollLeft = {
		set: function(e) {
			e.elem.nodeType && e.elem.parentNode && (e.elem[e.prop] = e.now)
		}
	}, T.easing = {
		linear: function(e) {
			return e
		},
		swing: function(e) {
			return .5 - Math.cos(e * Math.PI) / 2
		},
		_default: "swing"
	}, T.fx = nt.prototype.init, T.fx.step = {};
	var it, ot, rt, at, st = /^(?:toggle|show|hide)$/,
		lt = /queueHooks$/;

	function ct() {
		ot && (!1 === C.hidden && E.requestAnimationFrame ? E.requestAnimationFrame(ct) : E.setTimeout(ct, T.fx.interval), T.fx.tick())
	}

	function ut() {
		return E.setTimeout(function() {
			it = void 0
		}), it = T.now()
	}

	function dt(e, t) {
		var n, i = 0,
			o = {
				height: e
			};
		for (t = t ? 1 : 0; i < 4; i += 2 - t) o["margin" + (n = ee[i])] = o["padding" + n] = e;
		return t && (o.opacity = o.width = e), o
	}

	function ft(e, t, n) {
		for (var i, o = (ht.tweeners[t] || []).concat(ht.tweeners["*"]), r = 0, a = o.length; r < a; r++)
			if (i = o[r].call(n, t, e)) return i
	}

	function ht(r, e, t) {
		var n, a, i = 0,
			o = ht.prefilters.length,
			s = T.Deferred().always(function() {
				delete l.elem
			}),
			l = function() {
				if (a) return !1;
				for (var e = it || ut(), t = Math.max(0, c.startTime + c.duration - e), n = 1 - (t / c.duration || 0), i = 0, o = c.tweens.length; i < o; i++) c.tweens[i].run(n);
				return s.notifyWith(r, [c, n, t]), n < 1 && o ? t : (o || s.notifyWith(r, [c, 1, 0]), s.resolveWith(r, [c]), !1)
			},
			c = s.promise({
				elem: r,
				props: T.extend({}, e),
				opts: T.extend(!0, {
					specialEasing: {},
					easing: T.easing._default
				}, t),
				originalProperties: e,
				originalOptions: t,
				startTime: it || ut(),
				duration: t.duration,
				tweens: [],
				createTween: function(e, t) {
					var n = T.Tween(r, c.opts, e, t, c.opts.specialEasing[e] || c.opts.easing);
					return c.tweens.push(n), n
				},
				stop: function(e) {
					var t = 0,
						n = e ? c.tweens.length : 0;
					if (a) return this;
					for (a = !0; t < n; t++) c.tweens[t].run(1);
					return e ? (s.notifyWith(r, [c, 1, 0]), s.resolveWith(r, [c, e])) : s.rejectWith(r, [c, e]), this
				}
			}),
			u = c.props;
		for (function(e, t) {
				var n, i, o, r, a;
				for (n in e)
					if (o = t[i = T.camelCase(n)], r = e[n], Array.isArray(r) && (o = r[1], r = e[n] = r[0]), n !== i && (e[i] = r, delete e[n]), (a = T.cssHooks[i]) && "expand" in a)
						for (n in r = a.expand(r), delete e[i], r) n in e || (e[n] = r[n], t[n] = o);
					else t[i] = o
			}(u, c.opts.specialEasing); i < o; i++)
			if (n = ht.prefilters[i].call(c, r, u, c.opts)) return T.isFunction(n.stop) && (T._queueHooks(c.elem, c.opts.queue).stop = T.proxy(n.stop, n)), n;
		return T.map(u, ft, c), T.isFunction(c.opts.start) && c.opts.start.call(r, c), c.progress(c.opts.progress).done(c.opts.done, c.opts.complete).fail(c.opts.fail).always(c.opts.always), T.fx.timer(T.extend(l, {
			elem: r,
			anim: c,
			queue: c.opts.queue
		})), c
	}
	T.Animation = T.extend(ht, {
		tweeners: {
			"*": [function(e, t) {
				var n = this.createTween(e, t);
				return ne(n.elem, e, Z.exec(t), n), n
			}]
		},
		tweener: function(e, t) {
			for (var n, i = 0, o = (e = T.isFunction(e) ? (t = e, ["*"]) : e.match(L)).length; i < o; i++) n = e[i], ht.tweeners[n] = ht.tweeners[n] || [], ht.tweeners[n].unshift(t)
		},
		prefilters: [function(e, t, n) {
			var i, o, r, a, s, l, c, u, d = "width" in t || "height" in t,
				f = this,
				h = {},
				p = e.style,
				m = e.nodeType && te(e),
				g = V.get(e, "fxshow");
			for (i in n.queue || (null == (a = T._queueHooks(e, "fx")).unqueued && (a.unqueued = 0, s = a.empty.fire, a.empty.fire = function() {
					a.unqueued || s()
				}), a.unqueued++, f.always(function() {
					f.always(function() {
						a.unqueued--, T.queue(e, "fx").length || a.empty.fire()
					})
				})), t)
				if (o = t[i], st.test(o)) {
					if (delete t[i], r = r || "toggle" === o, o === (m ? "hide" : "show")) {
						if ("show" !== o || !g || void 0 === g[i]) continue;
						m = !0
					}
					h[i] = g && g[i] || T.style(e, i)
				}
			if ((l = !T.isEmptyObject(t)) || !T.isEmptyObject(h))
				for (i in d && 1 === e.nodeType && (n.overflow = [p.overflow, p.overflowX, p.overflowY], null == (c = g && g.display) && (c = V.get(e, "display")), "none" === (u = T.css(e, "display")) && (c ? u = c : (oe([e], !0), c = e.style.display || c, u = T.css(e, "display"), oe([e]))), ("inline" === u || "inline-block" === u && null != c) && "none" === T.css(e, "float") && (l || (f.done(function() {
						p.display = c
					}), null == c && (u = p.display, c = "none" === u ? "" : u)), p.display = "inline-block")), n.overflow && (p.overflow = "hidden", f.always(function() {
						p.overflow = n.overflow[0], p.overflowX = n.overflow[1], p.overflowY = n.overflow[2]
					})), l = !1, h) l || (g ? "hidden" in g && (m = g.hidden) : g = V.access(e, "fxshow", {
					display: c
				}), r && (g.hidden = !m), m && oe([e], !0), f.done(function() {
					for (i in m || oe([e]), V.remove(e, "fxshow"), h) T.style(e, i, h[i])
				})), l = ft(m ? g[i] : 0, i, f), i in g || (g[i] = l.start, m && (l.end = l.start, l.start = 0))
		}],
		prefilter: function(e, t) {
			t ? ht.prefilters.unshift(e) : ht.prefilters.push(e)
		}
	}), T.speed = function(e, t, n) {
		var i = e && "object" == typeof e ? T.extend({}, e) : {
			complete: n || !n && t || T.isFunction(e) && e,
			duration: e,
			easing: n && t || t && !T.isFunction(t) && t
		};
		return T.fx.off ? i.duration = 0 : "number" != typeof i.duration && (i.duration in T.fx.speeds ? i.duration = T.fx.speeds[i.duration] : i.duration = T.fx.speeds._default), null != i.queue && !0 !== i.queue || (i.queue = "fx"), i.old = i.complete, i.complete = function() {
			T.isFunction(i.old) && i.old.call(this), i.queue && T.dequeue(this, i.queue)
		}, i
	}, T.fn.extend({
		fadeTo: function(e, t, n, i) {
			return this.filter(te).css("opacity", 0).show().end().animate({
				opacity: t
			}, e, n, i)
		},
		animate: function(t, e, n, i) {
			function o() {
				var e = ht(this, T.extend({}, t), a);
				(r || V.get(this, "finish")) && e.stop(!0)
			}
			var r = T.isEmptyObject(t),
				a = T.speed(e, n, i);
			return o.finish = o, r || !1 === a.queue ? this.each(o) : this.queue(a.queue, o)
		},
		stop: function(o, e, r) {
			function a(e) {
				var t = e.stop;
				delete e.stop, t(r)
			}
			return "string" != typeof o && (r = e, e = o, o = void 0), e && !1 !== o && this.queue(o || "fx", []), this.each(function() {
				var e = !0,
					t = null != o && o + "queueHooks",
					n = T.timers,
					i = V.get(this);
				if (t) i[t] && i[t].stop && a(i[t]);
				else
					for (t in i) i[t] && i[t].stop && lt.test(t) && a(i[t]);
				for (t = n.length; t--;) n[t].elem !== this || null != o && n[t].queue !== o || (n[t].anim.stop(r), e = !1, n.splice(t, 1));
				!e && r || T.dequeue(this, o)
			})
		},
		finish: function(a) {
			return !1 !== a && (a = a || "fx"), this.each(function() {
				var e, t = V.get(this),
					n = t[a + "queue"],
					i = t[a + "queueHooks"],
					o = T.timers,
					r = n ? n.length : 0;
				for (t.finish = !0, T.queue(this, a, []), i && i.stop && i.stop.call(this, !0), e = o.length; e--;) o[e].elem === this && o[e].queue === a && (o[e].anim.stop(!0), o.splice(e, 1));
				for (e = 0; e < r; e++) n[e] && n[e].finish && n[e].finish.call(this);
				delete t.finish
			})
		}
	}), T.each(["toggle", "show", "hide"], function(e, i) {
		var o = T.fn[i];
		T.fn[i] = function(e, t, n) {
			return null == e || "boolean" == typeof e ? o.apply(this, arguments) : this.animate(dt(i, !0), e, t, n)
		}
	}), T.each({
		slideDown: dt("show"),
		slideUp: dt("hide"),
		slideToggle: dt("toggle"),
		fadeIn: {
			opacity: "show"
		},
		fadeOut: {
			opacity: "hide"
		},
		fadeToggle: {
			opacity: "toggle"
		}
	}, function(e, i) {
		T.fn[e] = function(e, t, n) {
			return this.animate(i, e, t, n)
		}
	}), T.timers = [], T.fx.tick = function() {
		var e, t = 0,
			n = T.timers;
		for (it = T.now(); t < n.length; t++)(e = n[t])() || n[t] !== e || n.splice(t--, 1);
		n.length || T.fx.stop(), it = void 0
	}, T.fx.timer = function(e) {
		T.timers.push(e), T.fx.start()
	}, T.fx.interval = 13, T.fx.start = function() {
		ot || (ot = !0, ct())
	}, T.fx.stop = function() {
		ot = null
	}, T.fx.speeds = {
		slow: 600,
		fast: 200,
		_default: 400
	}, T.fn.delay = function(i, e) {
		return i = T.fx && T.fx.speeds[i] || i, e = e || "fx", this.queue(e, function(e, t) {
			var n = E.setTimeout(e, i);
			t.stop = function() {
				E.clearTimeout(n)
			}
		})
	}, rt = C.createElement("input"), at = C.createElement("select").appendChild(C.createElement("option")), rt.type = "checkbox", g.checkOn = "" !== rt.value, g.optSelected = at.selected, (rt = C.createElement("input")).value = "t", rt.type = "radio", g.radioValue = "t" === rt.value;
	var pt, mt = T.expr.attrHandle;
	T.fn.extend({
		attr: function(e, t) {
			return U(this, T.attr, e, t, 1 < arguments.length)
		},
		removeAttr: function(e) {
			return this.each(function() {
				T.removeAttr(this, e)
			})
		}
	}), T.extend({
		attr: function(e, t, n) {
			var i, o, r = e.nodeType;
			if (3 !== r && 8 !== r && 2 !== r) return void 0 === e.getAttribute ? T.prop(e, t, n) : (1 === r && T.isXMLDoc(e) || (o = T.attrHooks[t.toLowerCase()] || (T.expr.match.bool.test(t) ? pt : void 0)), void 0 !== n ? null === n ? void T.removeAttr(e, t) : o && "set" in o && void 0 !== (i = o.set(e, n, t)) ? i : (e.setAttribute(t, n + ""), n) : o && "get" in o && null !== (i = o.get(e, t)) ? i : null == (i = T.find.attr(e, t)) ? void 0 : i)
		},
		attrHooks: {
			type: {
				set: function(e, t) {
					if (!g.radioValue && "radio" === t && D(e, "input")) {
						var n = e.value;
						return e.setAttribute("type", t), n && (e.value = n), t
					}
				}
			}
		},
		removeAttr: function(e, t) {
			var n, i = 0,
				o = t && t.match(L);
			if (o && 1 === e.nodeType)
				for (; n = o[i++];) e.removeAttribute(n)
		}
	}), pt = {
		set: function(e, t, n) {
			return !1 === t ? T.removeAttr(e, n) : e.setAttribute(n, n), n
		}
	}, T.each(T.expr.match.bool.source.match(/\w+/g), function(e, t) {
		var a = mt[t] || T.find.attr;
		mt[t] = function(e, t, n) {
			var i, o, r = t.toLowerCase();
			return n || (o = mt[r], mt[r] = i, i = null != a(e, t, n) ? r : null, mt[r] = o), i
		}
	});
	var gt = /^(?:input|select|textarea|button)$/i,
		vt = /^(?:a|area)$/i;

	function yt(e) {
		return (e.match(L) || []).join(" ")
	}

	function bt(e) {
		return e.getAttribute && e.getAttribute("class") || ""
	}
	T.fn.extend({
		prop: function(e, t) {
			return U(this, T.prop, e, t, 1 < arguments.length)
		},
		removeProp: function(e) {
			return this.each(function() {
				delete this[T.propFix[e] || e]
			})
		}
	}), T.extend({
		prop: function(e, t, n) {
			var i, o, r = e.nodeType;
			if (3 !== r && 8 !== r && 2 !== r) return 1 === r && T.isXMLDoc(e) || (t = T.propFix[t] || t, o = T.propHooks[t]), void 0 !== n ? o && "set" in o && void 0 !== (i = o.set(e, n, t)) ? i : e[t] = n : o && "get" in o && null !== (i = o.get(e, t)) ? i : e[t]
		},
		propHooks: {
			tabIndex: {
				get: function(e) {
					var t = T.find.attr(e, "tabindex");
					return t ? parseInt(t, 10) : gt.test(e.nodeName) || vt.test(e.nodeName) && e.href ? 0 : -1
				}
			}
		},
		propFix: {
			for: "htmlFor",
			class: "className"
		}
	}), g.optSelected || (T.propHooks.selected = {
		get: function(e) {
			var t = e.parentNode;
			return t && t.parentNode && t.parentNode.selectedIndex, null
		},
		set: function(e) {
			var t = e.parentNode;
			t && (t.selectedIndex, t.parentNode && t.parentNode.selectedIndex)
		}
	}), T.each(["tabIndex", "readOnly", "maxLength", "cellSpacing", "cellPadding", "rowSpan", "colSpan", "useMap", "frameBorder", "contentEditable"], function() {
		T.propFix[this.toLowerCase()] = this
	}), T.fn.extend({
		addClass: function(t) {
			var e, n, i, o, r, a, s, l = 0;
			if (T.isFunction(t)) return this.each(function(e) {
				T(this).addClass(t.call(this, e, bt(this)))
			});
			if ("string" == typeof t && t)
				for (e = t.match(L) || []; n = this[l++];)
					if (o = bt(n), i = 1 === n.nodeType && " " + yt(o) + " ") {
						for (a = 0; r = e[a++];) i.indexOf(" " + r + " ") < 0 && (i += r + " ");
						o !== (s = yt(i)) && n.setAttribute("class", s)
					}
			return this
		},
		removeClass: function(t) {
			var e, n, i, o, r, a, s, l = 0;
			if (T.isFunction(t)) return this.each(function(e) {
				T(this).removeClass(t.call(this, e, bt(this)))
			});
			if (!arguments.length) return this.attr("class", "");
			if ("string" == typeof t && t)
				for (e = t.match(L) || []; n = this[l++];)
					if (o = bt(n), i = 1 === n.nodeType && " " + yt(o) + " ") {
						for (a = 0; r = e[a++];)
							for (; - 1 < i.indexOf(" " + r + " ");) i = i.replace(" " + r + " ", " ");
						o !== (s = yt(i)) && n.setAttribute("class", s)
					}
			return this
		},
		toggleClass: function(o, t) {
			var r = typeof o;
			return "boolean" == typeof t && "string" == r ? t ? this.addClass(o) : this.removeClass(o) : T.isFunction(o) ? this.each(function(e) {
				T(this).toggleClass(o.call(this, e, bt(this), t), t)
			}) : this.each(function() {
				var e, t, n, i;
				if ("string" == r)
					for (t = 0, n = T(this), i = o.match(L) || []; e = i[t++];) n.hasClass(e) ? n.removeClass(e) : n.addClass(e);
				else void 0 !== o && "boolean" != r || ((e = bt(this)) && V.set(this, "__className__", e), this.setAttribute && this.setAttribute("class", e || !1 === o ? "" : V.get(this, "__className__") || ""))
			})
		},
		hasClass: function(e) {
			var t, n, i = 0;
			for (t = " " + e + " "; n = this[i++];)
				if (1 === n.nodeType && -1 < (" " + yt(bt(n)) + " ").indexOf(t)) return !0;
			return !1
		}
	});
	var wt = /\r/g;
	T.fn.extend({
		val: function(n) {
			var i, e, o, t = this[0];
			return arguments.length ? (o = T.isFunction(n), this.each(function(e) {
				var t;
				1 === this.nodeType && (null == (t = o ? n.call(this, e, T(this).val()) : n) ? t = "" : "number" == typeof t ? t += "" : Array.isArray(t) && (t = T.map(t, function(e) {
					return null == e ? "" : e + ""
				})), (i = T.valHooks[this.type] || T.valHooks[this.nodeName.toLowerCase()]) && "set" in i && void 0 !== i.set(this, t, "value") || (this.value = t))
			})) : t ? (i = T.valHooks[t.type] || T.valHooks[t.nodeName.toLowerCase()]) && "get" in i && void 0 !== (e = i.get(t, "value")) ? e : "string" == typeof(e = t.value) ? e.replace(wt, "") : null == e ? "" : e : void 0
		}
	}), T.extend({
		valHooks: {
			option: {
				get: function(e) {
					var t = T.find.attr(e, "value");
					return null != t ? t : yt(T.text(e))
				}
			},
			select: {
				get: function(e) {
					var t, n, i, o = e.options,
						r = e.selectedIndex,
						a = "select-one" === e.type,
						s = a ? null : [],
						l = a ? r + 1 : o.length;
					for (i = r < 0 ? l : a ? r : 0; i < l; i++)
						if (((n = o[i]).selected || i === r) && !n.disabled && (!n.parentNode.disabled || !D(n.parentNode, "optgroup"))) {
							if (t = T(n).val(), a) return t;
							s.push(t)
						}
					return s
				},
				set: function(e, t) {
					for (var n, i, o = e.options, r = T.makeArray(t), a = o.length; a--;)((i = o[a]).selected = -1 < T.inArray(T.valHooks.option.get(i), r)) && (n = !0);
					return n || (e.selectedIndex = -1), r
				}
			}
		}
	}), T.each(["radio", "checkbox"], function() {
		T.valHooks[this] = {
			set: function(e, t) {
				if (Array.isArray(t)) return e.checked = -1 < T.inArray(T(e).val(), t)
			}
		}, g.checkOn || (T.valHooks[this].get = function(e) {
			return null === e.getAttribute("value") ? "on" : e.value
		})
	});
	var _t = /^(?:focusinfocus|focusoutblur)$/;
	T.extend(T.event, {
		trigger: function(e, t, n, i) {
			var o, r, a, s, l, c, u, d = [n || C],
				f = p.call(e, "type") ? e.type : e,
				h = p.call(e, "namespace") ? e.namespace.split(".") : [];
			if (r = a = n = n || C, 3 !== n.nodeType && 8 !== n.nodeType && !_t.test(f + T.event.triggered) && (-1 < f.indexOf(".") && (f = (h = f.split(".")).shift(), h.sort()), l = f.indexOf(":") < 0 && "on" + f, (e = e[T.expando] ? e : new T.Event(f, "object" == typeof e && e)).isTrigger = i ? 2 : 3, e.namespace = h.join("."), e.rnamespace = e.namespace ? new RegExp("(^|\\.)" + h.join("\\.(?:.*\\.|)") + "(\\.|$)") : null, e.result = void 0, e.target || (e.target = n), t = null == t ? [e] : T.makeArray(t, [e]), u = T.event.special[f] || {}, i || !u.trigger || !1 !== u.trigger.apply(n, t))) {
				if (!i && !u.noBubble && !T.isWindow(n)) {
					for (s = u.delegateType || f, _t.test(s + f) || (r = r.parentNode); r; r = r.parentNode) d.push(r), a = r;
					a === (n.ownerDocument || C) && d.push(a.defaultView || a.parentWindow || E)
				}
				for (o = 0;
					(r = d[o++]) && !e.isPropagationStopped();) e.type = 1 < o ? s : u.bindType || f, (c = (V.get(r, "events") || {})[e.type] && V.get(r, "handle")) && c.apply(r, t), (c = l && r[l]) && c.apply && B(r) && (e.result = c.apply(r, t), !1 === e.result && e.preventDefault());
				return e.type = f, i || e.isDefaultPrevented() || u._default && !1 !== u._default.apply(d.pop(), t) || !B(n) || l && T.isFunction(n[f]) && !T.isWindow(n) && ((a = n[l]) && (n[l] = null), n[T.event.triggered = f](), T.event.triggered = void 0, a && (n[l] = a)), e.result
			}
		},
		simulate: function(e, t, n) {
			var i = T.extend(new T.Event, n, {
				type: e,
				isSimulated: !0
			});
			T.event.trigger(i, null, t)
		}
	}), T.fn.extend({
		trigger: function(e, t) {
			return this.each(function() {
				T.event.trigger(e, t, this)
			})
		},
		triggerHandler: function(e, t) {
			var n = this[0];
			if (n) return T.event.trigger(e, t, n, !0)
		}
	}), T.each("blur focus focusin focusout resize scroll click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select submit keydown keypress keyup contextmenu".split(" "), function(e, n) {
		T.fn[n] = function(e, t) {
			return 0 < arguments.length ? this.on(n, null, e, t) : this.trigger(n)
		}
	}), T.fn.extend({
		hover: function(e, t) {
			return this.mouseenter(e).mouseleave(t || e)
		}
	}), g.focusin = "onfocusin" in E, g.focusin || T.each({
		focus: "focusin",
		blur: "focusout"
	}, function(n, i) {
		function o(e) {
			T.event.simulate(i, e.target, T.event.fix(e))
		}
		T.event.special[i] = {
			setup: function() {
				var e = this.ownerDocument || this,
					t = V.access(e, i);
				t || e.addEventListener(n, o, !0), V.access(e, i, (t || 0) + 1)
			},
			teardown: function() {
				var e = this.ownerDocument || this,
					t = V.access(e, i) - 1;
				t ? V.access(e, i, t) : (e.removeEventListener(n, o, !0), V.remove(e, i))
			}
		}
	});
	var xt = E.location,
		Et = T.now(),
		Ct = /\?/;
	T.parseXML = function(e) {
		var t;
		if (!e || "string" != typeof e) return null;
		try {
			t = (new E.DOMParser).parseFromString(e, "text/xml")
		} catch (e) {
			t = void 0
		}
		return t && !t.getElementsByTagName("parsererror").length || T.error("Invalid XML: " + e), t
	};
	var Tt = /\[\]$/,
		St = /\r?\n/g,
		Dt = /^(?:submit|button|image|reset|file)$/i,
		At = /^(?:input|select|textarea|keygen)/i;

	function kt(n, e, i, o) {
		var t;
		if (Array.isArray(e)) T.each(e, function(e, t) {
			i || Tt.test(n) ? o(n, t) : kt(n + "[" + ("object" == typeof t && null != t ? e : "") + "]", t, i, o)
		});
		else if (i || "object" !== T.type(e)) o(n, e);
		else
			for (t in e) kt(n + "[" + t + "]", e[t], i, o)
	}
	T.param = function(e, t) {
		function n(e, t) {
			var n = T.isFunction(t) ? t() : t;
			o[o.length] = encodeURIComponent(e) + "=" + encodeURIComponent(null == n ? "" : n)
		}
		var i, o = [];
		if (Array.isArray(e) || e.jquery && !T.isPlainObject(e)) T.each(e, function() {
			n(this.name, this.value)
		});
		else
			for (i in e) kt(i, e[i], t, n);
		return o.join("&")
	}, T.fn.extend({
		serialize: function() {
			return T.param(this.serializeArray())
		},
		serializeArray: function() {
			return this.map(function() {
				var e = T.prop(this, "elements");
				return e ? T.makeArray(e) : this
			}).filter(function() {
				var e = this.type;
				return this.name && !T(this).is(":disabled") && At.test(this.nodeName) && !Dt.test(e) && (this.checked || !re.test(e))
			}).map(function(e, t) {
				var n = T(this).val();
				return null == n ? null : Array.isArray(n) ? T.map(n, function(e) {
					return {
						name: t.name,
						value: e.replace(St, "\r\n")
					}
				}) : {
					name: t.name,
					value: n.replace(St, "\r\n")
				}
			}).get()
		}
	});
	var Nt = /%20/g,
		It = /#.*$/,
		Ot = /([?&])_=[^&]*/,
		$t = /^(.*?):[ \t]*([^\r\n]*)$/gm,
		jt = /^(?:GET|HEAD)$/,
		Pt = /^\/\//,
		Lt = {},
		Mt = {},
		Ht = "*/".concat("*"),
		Rt = C.createElement("a");

	function qt(r) {
		return function(e, t) {
			"string" != typeof e && (t = e, e = "*");
			var n, i = 0,
				o = e.toLowerCase().match(L) || [];
			if (T.isFunction(t))
				for (; n = o[i++];) "+" === n[0] ? (n = n.slice(1) || "*", (r[n] = r[n] || []).unshift(t)) : (r[n] = r[n] || []).push(t)
		}
	}

	function Ft(t, o, r, a) {
		var s = {},
			l = t === Mt;

		function c(e) {
			var i;
			return s[e] = !0, T.each(t[e] || [], function(e, t) {
				var n = t(o, r, a);
				return "string" != typeof n || l || s[n] ? l ? !(i = n) : void 0 : (o.dataTypes.unshift(n), c(n), !1)
			}), i
		}
		return c(o.dataTypes[0]) || !s["*"] && c("*")
	}

	function Wt(e, t) {
		var n, i, o = T.ajaxSettings.flatOptions || {};
		for (n in t) void 0 !== t[n] && ((o[n] ? e : i = i || {})[n] = t[n]);
		return i && T.extend(!0, e, i), e
	}
	Rt.href = xt.href, T.extend({
		active: 0,
		lastModified: {},
		etag: {},
		ajaxSettings: {
			url: xt.href,
			type: "GET",
			isLocal: /^(?:about|app|app-storage|.+-extension|file|res|widget):$/.test(xt.protocol),
			global: !0,
			processData: !0,
			async: !0,
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			accepts: {
				"*": Ht,
				text: "text/plain",
				html: "text/html",
				xml: "application/xml, text/xml",
				json: "application/json, text/javascript"
			},
			contents: {
				xml: /\bxml\b/,
				html: /\bhtml/,
				json: /\bjson\b/
			},
			responseFields: {
				xml: "responseXML",
				text: "responseText",
				json: "responseJSON"
			},
			converters: {
				"* text": String,
				"text html": !0,
				"text json": JSON.parse,
				"text xml": T.parseXML
			},
			flatOptions: {
				url: !0,
				context: !0
			}
		},
		ajaxSetup: function(e, t) {
			return t ? Wt(Wt(e, T.ajaxSettings), t) : Wt(T.ajaxSettings, e)
		},
		ajaxPrefilter: qt(Lt),
		ajaxTransport: qt(Mt),
		ajax: function(e, t) {
			"object" == typeof e && (t = e, e = void 0), t = t || {};
			var u, d, f, n, h, i, p, m, o, r, g = T.ajaxSetup({}, t),
				v = g.context || g,
				y = g.context && (v.nodeType || v.jquery) ? T(v) : T.event,
				b = T.Deferred(),
				w = T.Callbacks("once memory"),
				_ = g.statusCode || {},
				a = {},
				s = {},
				l = "canceled",
				x = {
					readyState: 0,
					getResponseHeader: function(e) {
						var t;
						if (p) {
							if (!n)
								for (n = {}; t = $t.exec(f);) n[t[1].toLowerCase()] = t[2];
							t = n[e.toLowerCase()]
						}
						return null == t ? null : t
					},
					getAllResponseHeaders: function() {
						return p ? f : null
					},
					setRequestHeader: function(e, t) {
						return null == p && (e = s[e.toLowerCase()] = s[e.toLowerCase()] || e, a[e] = t), this
					},
					overrideMimeType: function(e) {
						return null == p && (g.mimeType = e), this
					},
					statusCode: function(e) {
						var t;
						if (e)
							if (p) x.always(e[x.status]);
							else
								for (t in e) _[t] = [_[t], e[t]];
						return this
					},
					abort: function(e) {
						var t = e || l;
						return u && u.abort(t), c(0, t), this
					}
				};
			if (b.promise(x), g.url = ((e || g.url || xt.href) + "").replace(Pt, xt.protocol + "//"), g.type = t.method || t.type || g.method || g.type, g.dataTypes = (g.dataType || "*").toLowerCase().match(L) || [""], null == g.crossDomain) {
				i = C.createElement("a");
				try {
					i.href = g.url, i.href = i.href, g.crossDomain = Rt.protocol + "//" + Rt.host != i.protocol + "//" + i.host
				} catch (e) {
					g.crossDomain = !0
				}
			}
			if (g.data && g.processData && "string" != typeof g.data && (g.data = T.param(g.data, g.traditional)), Ft(Lt, g, t, x), p) return x;
			for (o in (m = T.event && g.global) && 0 == T.active++ && T.event.trigger("ajaxStart"), g.type = g.type.toUpperCase(), g.hasContent = !jt.test(g.type), d = g.url.replace(It, ""), g.hasContent ? g.data && g.processData && 0 === (g.contentType || "").indexOf("application/x-www-form-urlencoded") && (g.data = g.data.replace(Nt, "+")) : (r = g.url.slice(d.length), g.data && (d += (Ct.test(d) ? "&" : "?") + g.data, delete g.data), !1 === g.cache && (d = d.replace(Ot, "$1"), r = (Ct.test(d) ? "&" : "?") + "_=" + Et++ + r), g.url = d + r), g.ifModified && (T.lastModified[d] && x.setRequestHeader("If-Modified-Since", T.lastModified[d]), T.etag[d] && x.setRequestHeader("If-None-Match", T.etag[d])), (g.data && g.hasContent && !1 !== g.contentType || t.contentType) && x.setRequestHeader("Content-Type", g.contentType), x.setRequestHeader("Accept", g.dataTypes[0] && g.accepts[g.dataTypes[0]] ? g.accepts[g.dataTypes[0]] + ("*" !== g.dataTypes[0] ? ", " + Ht + "; q=0.01" : "") : g.accepts["*"]), g.headers) x.setRequestHeader(o, g.headers[o]);
			if (g.beforeSend && (!1 === g.beforeSend.call(v, x, g) || p)) return x.abort();
			if (l = "abort", w.add(g.complete), x.done(g.success), x.fail(g.error), u = Ft(Mt, g, t, x)) {
				if (x.readyState = 1, m && y.trigger("ajaxSend", [x, g]), p) return x;
				g.async && 0 < g.timeout && (h = E.setTimeout(function() {
					x.abort("timeout")
				}, g.timeout));
				try {
					p = !1, u.send(a, c)
				} catch (e) {
					if (p) throw e;
					c(-1, e)
				}
			} else c(-1, "No Transport");

			function c(e, t, n, i) {
				var o, r, a, s, l, c = t;
				p || (p = !0, h && E.clearTimeout(h), u = void 0, f = i || "", x.readyState = 0 < e ? 4 : 0, o = 200 <= e && e < 300 || 304 === e, n && (s = function(e, t, n) {
					for (var i, o, r, a, s = e.contents, l = e.dataTypes;
						"*" === l[0];) l.shift(), void 0 === i && (i = e.mimeType || t.getResponseHeader("Content-Type"));
					if (i)
						for (o in s)
							if (s[o] && s[o].test(i)) {
								l.unshift(o);
								break
							}
					if (l[0] in n) r = l[0];
					else {
						for (o in n) {
							if (!l[0] || e.converters[o + " " + l[0]]) {
								r = o;
								break
							}
							a = a || o
						}
						r = r || a
					}
					if (r) return r !== l[0] && l.unshift(r), n[r]
				}(g, x, n)), s = function(e, t, n, i) {
					var o, r, a, s, l, c = {},
						u = e.dataTypes.slice();
					if (u[1])
						for (a in e.converters) c[a.toLowerCase()] = e.converters[a];
					for (r = u.shift(); r;)
						if (e.responseFields[r] && (n[e.responseFields[r]] = t), !l && i && e.dataFilter && (t = e.dataFilter(t, e.dataType)), l = r, r = u.shift())
							if ("*" === r) r = l;
							else if ("*" !== l && l !== r) {
						if (!(a = c[l + " " + r] || c["* " + r]))
							for (o in c)
								if ((s = o.split(" "))[1] === r && (a = c[l + " " + s[0]] || c["* " + s[0]])) {
									!0 === a ? a = c[o] : !0 !== c[o] && (r = s[0], u.unshift(s[1]));
									break
								}
						if (!0 !== a)
							if (a && e.throws) t = a(t);
							else try {
								t = a(t)
							} catch (e) {
								return {
									state: "parsererror",
									error: a ? e : "No conversion from " + l + " to " + r
								}
							}
					}
					return {
						state: "success",
						data: t
					}
				}(g, s, x, o), o ? (g.ifModified && ((l = x.getResponseHeader("Last-Modified")) && (T.lastModified[d] = l), (l = x.getResponseHeader("etag")) && (T.etag[d] = l)), 204 === e || "HEAD" === g.type ? c = "nocontent" : 304 === e ? c = "notmodified" : (c = s.state, r = s.data, o = !(a = s.error))) : (a = c, !e && c || (c = "error", e < 0 && (e = 0))), x.status = e, x.statusText = (t || c) + "", o ? b.resolveWith(v, [r, c, x]) : b.rejectWith(v, [x, c, a]), x.statusCode(_), _ = void 0, m && y.trigger(o ? "ajaxSuccess" : "ajaxError", [x, g, o ? r : a]), w.fireWith(v, [x, c]), m && (y.trigger("ajaxComplete", [x, g]), --T.active || T.event.trigger("ajaxStop")))
			}
			return x
		},
		getJSON: function(e, t, n) {
			return T.get(e, t, n, "json")
		},
		getScript: function(e, t) {
			return T.get(e, void 0, t, "script")
		}
	}), T.each(["get", "post"], function(e, o) {
		T[o] = function(e, t, n, i) {
			return T.isFunction(t) && (i = i || n, n = t, t = void 0), T.ajax(T.extend({
				url: e,
				type: o,
				dataType: i,
				data: t,
				success: n
			}, T.isPlainObject(e) && e))
		}
	}), T._evalUrl = function(e) {
		return T.ajax({
			url: e,
			type: "GET",
			dataType: "script",
			cache: !0,
			async: !1,
			global: !1,
			throws: !0
		})
	}, T.fn.extend({
		wrapAll: function(e) {
			var t;
			return this[0] && (T.isFunction(e) && (e = e.call(this[0])), t = T(e, this[0].ownerDocument).eq(0).clone(!0), this[0].parentNode && t.insertBefore(this[0]), t.map(function() {
				for (var e = this; e.firstElementChild;) e = e.firstElementChild;
				return e
			}).append(this)), this
		},
		wrapInner: function(n) {
			return T.isFunction(n) ? this.each(function(e) {
				T(this).wrapInner(n.call(this, e))
			}) : this.each(function() {
				var e = T(this),
					t = e.contents();
				t.length ? t.wrapAll(n) : e.append(n)
			})
		},
		wrap: function(t) {
			var n = T.isFunction(t);
			return this.each(function(e) {
				T(this).wrapAll(n ? t.call(this, e) : t)
			})
		},
		unwrap: function(e) {
			return this.parent(e).not("body").each(function() {
				T(this).replaceWith(this.childNodes)
			}), this
		}
	}), T.expr.pseudos.hidden = function(e) {
		return !T.expr.pseudos.visible(e)
	}, T.expr.pseudos.visible = function(e) {
		return !!(e.offsetWidth || e.offsetHeight || e.getClientRects().length)
	}, T.ajaxSettings.xhr = function() {
		try {
			return new E.XMLHttpRequest
		} catch (e) {}
	};
	var Bt = {
			0: 200,
			1223: 204
		},
		Ut = T.ajaxSettings.xhr();
	g.cors = !!Ut && "withCredentials" in Ut, g.ajax = Ut = !!Ut, T.ajaxTransport(function(o) {
		var r, a;
		if (g.cors || Ut && !o.crossDomain) return {
			send: function(e, t) {
				var n, i = o.xhr();
				if (i.open(o.type, o.url, o.async, o.username, o.password), o.xhrFields)
					for (n in o.xhrFields) i[n] = o.xhrFields[n];
				for (n in o.mimeType && i.overrideMimeType && i.overrideMimeType(o.mimeType), o.crossDomain || e["X-Requested-With"] || (e["X-Requested-With"] = "XMLHttpRequest"), e) i.setRequestHeader(n, e[n]);
				r = function(e) {
					return function() {
						r && (r = a = i.onload = i.onerror = i.onabort = i.onreadystatechange = null, "abort" === e ? i.abort() : "error" === e ? "number" != typeof i.status ? t(0, "error") : t(i.status, i.statusText) : t(Bt[i.status] || i.status, i.statusText, "text" !== (i.responseType || "text") || "string" != typeof i.responseText ? {
							binary: i.response
						} : {
							text: i.responseText
						}, i.getAllResponseHeaders()))
					}
				}, i.onload = r(), a = i.onerror = r("error"), void 0 !== i.onabort ? i.onabort = a : i.onreadystatechange = function() {
					4 === i.readyState && E.setTimeout(function() {
						r && a()
					})
				}, r = r("abort");
				try {
					i.send(o.hasContent && o.data || null)
				} catch (e) {
					if (r) throw e
				}
			},
			abort: function() {
				r && r()
			}
		}
	}), T.ajaxPrefilter(function(e) {
		e.crossDomain && (e.contents.script = !1)
	}), T.ajaxSetup({
		accepts: {
			script: "text/javascript, application/javascript, application/ecmascript, application/x-ecmascript"
		},
		contents: {
			script: /\b(?:java|ecma)script\b/
		},
		converters: {
			"text script": function(e) {
				return T.globalEval(e), e
			}
		}
	}), T.ajaxPrefilter("script", function(e) {
		void 0 === e.cache && (e.cache = !1), e.crossDomain && (e.type = "GET")
	}), T.ajaxTransport("script", function(n) {
		var i, o;
		if (n.crossDomain) return {
			send: function(e, t) {
				i = T("<script>").prop({
					charset: n.scriptCharset,
					src: n.url
				}).on("load error", o = function(e) {
					i.remove(), o = null, e && t("error" === e.type ? 404 : 200, e.type)
				}), C.head.appendChild(i[0])
			},
			abort: function() {
				o && o()
			}
		}
	});
	var Kt, Vt = [],
		Xt = /(=)\?(?=&|$)|\?\?/;
	T.ajaxSetup({
		jsonp: "callback",
		jsonpCallback: function() {
			var e = Vt.pop() || T.expando + "_" + Et++;
			return this[e] = !0, e
		}
	}), T.ajaxPrefilter("json jsonp", function(e, t, n) {
		var i, o, r, a = !1 !== e.jsonp && (Xt.test(e.url) ? "url" : "string" == typeof e.data && 0 === (e.contentType || "").indexOf("application/x-www-form-urlencoded") && Xt.test(e.data) && "data");
		if (a || "jsonp" === e.dataTypes[0]) return i = e.jsonpCallback = T.isFunction(e.jsonpCallback) ? e.jsonpCallback() : e.jsonpCallback, a ? e[a] = e[a].replace(Xt, "$1" + i) : !1 !== e.jsonp && (e.url += (Ct.test(e.url) ? "&" : "?") + e.jsonp + "=" + i), e.converters["script json"] = function() {
			return r || T.error(i + " was not called"), r[0]
		}, e.dataTypes[0] = "json", o = E[i], E[i] = function() {
			r = arguments
		}, n.always(function() {
			void 0 === o ? T(E).removeProp(i) : E[i] = o, e[i] && (e.jsonpCallback = t.jsonpCallback, Vt.push(i)), r && T.isFunction(o) && o(r[0]), r = o = void 0
		}), "script"
	}), g.createHTMLDocument = ((Kt = C.implementation.createHTMLDocument("").body).innerHTML = "<form></form><form></form>", 2 === Kt.childNodes.length), T.parseHTML = function(e, t, n) {
		return "string" != typeof e ? [] : ("boolean" == typeof t && (n = t, t = !1), t || (g.createHTMLDocument ? ((i = (t = C.implementation.createHTMLDocument("")).createElement("base")).href = C.location.href, t.head.appendChild(i)) : t = C), r = !n && [], (o = A.exec(e)) ? [t.createElement(o[1])] : (o = pe([e], t, r), r && r.length && T(r).remove(), T.merge([], o.childNodes)));
		var i, o, r
	}, T.fn.load = function(e, t, n) {
		var i, o, r, a = this,
			s = e.indexOf(" ");
		return -1 < s && (i = yt(e.slice(s)), e = e.slice(0, s)), T.isFunction(t) ? (n = t, t = void 0) : t && "object" == typeof t && (o = "POST"), 0 < a.length && T.ajax({
			url: e,
			type: o || "GET",
			dataType: "html",
			data: t
		}).done(function(e) {
			r = arguments, a.html(i ? T("<div>").append(T.parseHTML(e)).find(i) : e)
		}).always(n && function(e, t) {
			a.each(function() {
				n.apply(this, r || [e.responseText, t, e])
			})
		}), this
	}, T.each(["ajaxStart", "ajaxStop", "ajaxComplete", "ajaxError", "ajaxSuccess", "ajaxSend"], function(e, t) {
		T.fn[t] = function(e) {
			return this.on(t, e)
		}
	}), T.expr.pseudos.animated = function(t) {
		return T.grep(T.timers, function(e) {
			return t === e.elem
		}).length
	}, T.offset = {
		setOffset: function(e, t, n) {
			var i, o, r, a, s, l, c = T.css(e, "position"),
				u = T(e),
				d = {};
			"static" === c && (e.style.position = "relative"), s = u.offset(), r = T.css(e, "top"), l = T.css(e, "left"), o = ("absolute" === c || "fixed" === c) && -1 < (r + l).indexOf("auto") ? (a = (i = u.position()).top, i.left) : (a = parseFloat(r) || 0, parseFloat(l) || 0), T.isFunction(t) && (t = t.call(e, n, T.extend({}, s))), null != t.top && (d.top = t.top - s.top + a), null != t.left && (d.left = t.left - s.left + o), "using" in t ? t.using.call(e, d) : u.css(d)
		}
	}, T.fn.extend({
		offset: function(t) {
			if (arguments.length) return void 0 === t ? this : this.each(function(e) {
				T.offset.setOffset(this, t, e)
			});
			var e, n, i, o, r = this[0];
			return r ? r.getClientRects().length ? (i = r.getBoundingClientRect(), n = (e = r.ownerDocument).documentElement, o = e.defaultView, {
				top: i.top + o.pageYOffset - n.clientTop,
				left: i.left + o.pageXOffset - n.clientLeft
			}) : {
				top: 0,
				left: 0
			} : void 0
		},
		position: function() {
			if (this[0]) {
				var e, t, n = this[0],
					i = {
						top: 0,
						left: 0
					};
				return "fixed" === T.css(n, "position") ? t = n.getBoundingClientRect() : (e = this.offsetParent(), t = this.offset(), D(e[0], "html") || (i = e.offset()), i = {
					top: i.top + T.css(e[0], "borderTopWidth", !0),
					left: i.left + T.css(e[0], "borderLeftWidth", !0)
				}), {
					top: t.top - i.top - T.css(n, "marginTop", !0),
					left: t.left - i.left - T.css(n, "marginLeft", !0)
				}
			}
		},
		offsetParent: function() {
			return this.map(function() {
				for (var e = this.offsetParent; e && "static" === T.css(e, "position");) e = e.offsetParent;
				return e || me
			})
		}
	}), T.each({
		scrollLeft: "pageXOffset",
		scrollTop: "pageYOffset"
	}, function(t, o) {
		var r = "pageYOffset" === o;
		T.fn[t] = function(e) {
			return U(this, function(e, t, n) {
				var i;
				return T.isWindow(e) ? i = e : 9 === e.nodeType && (i = e.defaultView), void 0 === n ? i ? i[o] : e[t] : void(i ? i.scrollTo(r ? i.pageXOffset : n, r ? n : i.pageYOffset) : e[t] = n)
			}, t, e, arguments.length)
		}
	}), T.each(["top", "left"], function(e, n) {
		T.cssHooks[n] = Ke(g.pixelPosition, function(e, t) {
			if (t) return t = Ue(e, n), Fe.test(t) ? T(e).position()[n] + "px" : t
		})
	}), T.each({
		Height: "height",
		Width: "width"
	}, function(a, s) {
		T.each({
			padding: "inner" + a,
			content: s,
			"": "outer" + a
		}, function(i, r) {
			T.fn[r] = function(e, t) {
				var n = arguments.length && (i || "boolean" != typeof e),
					o = i || (!0 === e || !0 === t ? "margin" : "border");
				return U(this, function(e, t, n) {
					var i;
					return T.isWindow(e) ? 0 === r.indexOf("outer") ? e["inner" + a] : e.document.documentElement["client" + a] : 9 === e.nodeType ? (i = e.documentElement, Math.max(e.body["scroll" + a], i["scroll" + a], e.body["offset" + a], i["offset" + a], i["client" + a])) : void 0 === n ? T.css(e, t, o) : T.style(e, t, n, o)
				}, s, n ? e : void 0, n)
			}
		})
	}), T.fn.extend({
		bind: function(e, t, n) {
			return this.on(e, null, t, n)
		},
		unbind: function(e, t) {
			return this.off(e, null, t)
		},
		delegate: function(e, t, n, i) {
			return this.on(t, e, n, i)
		},
		undelegate: function(e, t, n) {
			return 1 === arguments.length ? this.off(e, "**") : this.off(t, e || "**", n)
		}
	}), T.holdReady = function(e) {
		e ? T.readyWait++ : T.ready(!0)
	}, T.isArray = Array.isArray, T.parseJSON = JSON.parse, T.nodeName = D, "function" == typeof define && define.amd && define("jquery", [], function() {
		return T
	});
	var Yt = E.jQuery,
		zt = E.$;
	return T.noConflict = function(e) {
		return E.$ === T && (E.$ = zt), e && E.jQuery === T && (E.jQuery = Yt), T
	}, e || (E.jQuery = E.$ = T), T
}),
function(e, t) {
	"object" == typeof exports && "undefined" != typeof module ? module.exports = t() : "function" == typeof define && define.amd ? define(t) : e.Popper = t()
}(this, function() {
	"use strict";

	function r(e) {
		return e && "[object Function]" === {}.toString.call(e)
	}

	function w(e, t) {
		if (1 !== e.nodeType) return [];
		var n = getComputedStyle(e, null);
		return t ? n[t] : n
	}

	function y(e) {
		return "HTML" === e.nodeName ? e : e.parentNode || e.host
	}

	function b(e) {
		if (!e) return document.body;
		switch (e.nodeName) {
			case "HTML":
			case "BODY":
				return e.ownerDocument.body;
			case "#document":
				return e.body
		}
		var t = w(e),
			n = t.overflow,
			i = t.overflowX,
			o = t.overflowY;
		return /(auto|scroll)/.test(n + o + i) ? e : b(y(e))
	}

	function _(e) {
		var t = e && e.offsetParent,
			n = t && t.nodeName;
		return n && "BODY" !== n && "HTML" !== n ? -1 !== ["TD", "TABLE"].indexOf(t.nodeName) && "static" === w(t, "position") ? _(t) : t : e ? e.ownerDocument.documentElement : document.documentElement
	}

	function u(e) {
		return null === e.parentNode ? e : u(e.parentNode)
	}

	function x(e, t) {
		if (!(e && e.nodeType && t && t.nodeType)) return document.documentElement;
		var n = e.compareDocumentPosition(t) & Node.DOCUMENT_POSITION_FOLLOWING,
			i = n ? e : t,
			o = n ? t : e,
			r = document.createRange();
		r.setStart(i, 0), r.setEnd(o, 0);
		var a, s, l = r.commonAncestorContainer;
		if (e !== l && t !== l || i.contains(o)) return "BODY" === (s = (a = l).nodeName) || "HTML" !== s && _(a.firstElementChild) !== a ? _(l) : l;
		var c = u(e);
		return c.host ? x(c.host, t) : x(e, u(t).host)
	}

	function E(e, t) {
		var n = "top" === (1 < arguments.length && void 0 !== t ? t : "top") ? "scrollTop" : "scrollLeft",
			i = e.nodeName;
		if ("BODY" !== i && "HTML" !== i) return e[n];
		var o = e.ownerDocument.documentElement;
		return (e.ownerDocument.scrollingElement || o)[n]
	}

	function d(e, t) {
		var n = "x" === t ? "Left" : "Top",
			i = "Left" == n ? "Right" : "Bottom";
		return parseFloat(e["border" + n + "Width"], 10) + parseFloat(e["border" + i + "Width"], 10)
	}

	function i(e, t, n, i) {
		return M(t["offset" + e], t["scroll" + e], n["client" + e], n["offset" + e], n["scroll" + e], W() ? n["offset" + e] + i["margin" + ("Height" === e ? "Top" : "Left")] + i["margin" + ("Height" === e ? "Bottom" : "Right")] : 0)
	}

	function C() {
		var e = document.body,
			t = document.documentElement,
			n = W() && getComputedStyle(t);
		return {
			height: i("Height", e, t, n),
			width: i("Width", e, t, n)
		}
	}

	function T(e) {
		return U({}, e, {
			right: e.left + e.width,
			bottom: e.top + e.height
		})
	}

	function S(e) {
		var t = {};
		if (W()) try {
			t = e.getBoundingClientRect();
			var n = E(e, "top"),
				i = E(e, "left");
			t.top += n, t.left += i, t.bottom += n, t.right += i
		} catch (e) {} else t = e.getBoundingClientRect();
		var o = {
				left: t.left,
				top: t.top,
				width: t.right - t.left,
				height: t.bottom - t.top
			},
			r = "HTML" === e.nodeName ? C() : {},
			a = r.width || e.clientWidth || o.right - o.left,
			s = r.height || e.clientHeight || o.bottom - o.top,
			l = e.offsetWidth - a,
			c = e.offsetHeight - s;
		if (l || c) {
			var u = w(e);
			l -= d(u, "x"), c -= d(u, "y"), o.width -= l, o.height -= c
		}
		return T(o)
	}

	function D(e, t) {
		var n = W(),
			i = "HTML" === t.nodeName,
			o = S(e),
			r = S(t),
			a = b(e),
			s = w(t),
			l = parseFloat(s.borderTopWidth, 10),
			c = parseFloat(s.borderLeftWidth, 10),
			u = T({
				top: o.top - r.top - l,
				left: o.left - r.left - c,
				width: o.width,
				height: o.height
			});
		if (u.marginTop = 0, u.marginLeft = 0, !n && i) {
			var d = parseFloat(s.marginTop, 10),
				f = parseFloat(s.marginLeft, 10);
			u.top -= l - d, u.bottom -= l - d, u.left -= c - f, u.right -= c - f, u.marginTop = d, u.marginLeft = f
		}
		return (n ? t.contains(a) : t === a && "BODY" !== a.nodeName) && (u = function(e, t, n) {
			var i = 2 < arguments.length && void 0 !== n && n,
				o = E(t, "top"),
				r = E(t, "left"),
				a = i ? -1 : 1;
			return e.top += o * a, e.bottom += o * a, e.left += r * a, e.right += r * a, e
		}(u, t)), u
	}

	function h(e, t, n, i) {
		var o, r, a, s, l, c, u, d = {
				top: 0,
				left: 0
			},
			f = x(e, t);
		if ("viewport" === i) r = (o = f).ownerDocument.documentElement, a = D(o, r), s = M(r.clientWidth, window.innerWidth || 0), l = M(r.clientHeight, window.innerHeight || 0), c = E(r), u = E(r, "left"), d = T({
			top: c - a.top + a.marginTop,
			left: u - a.left + a.marginLeft,
			width: s,
			height: l
		});
		else {
			var h;
			"scrollParent" === i ? "BODY" === (h = b(y(t))).nodeName && (h = e.ownerDocument.documentElement) : h = "window" === i ? e.ownerDocument.documentElement : i;
			var p = D(h, f);
			if ("HTML" !== h.nodeName || function e(t) {
					var n = t.nodeName;
					return "BODY" !== n && "HTML" !== n && ("fixed" === w(t, "position") || e(y(t)))
				}(f)) d = p;
			else {
				var m = C(),
					g = m.height,
					v = m.width;
				d.top += p.top - p.marginTop, d.bottom = g + p.top, d.left += p.left - p.marginLeft, d.right = v + p.left
			}
		}
		return d.left += n, d.top += n, d.right -= n, d.bottom -= n, d
	}

	function s(e, t, i, n, o, r) {
		var a = 5 < arguments.length && void 0 !== r ? r : 0;
		if (-1 === e.indexOf("auto")) return e;
		var s = h(i, n, a, o),
			l = {
				top: {
					width: s.width,
					height: t.top - s.top
				},
				right: {
					width: s.right - t.right,
					height: s.height
				},
				bottom: {
					width: s.width,
					height: s.bottom - t.bottom
				},
				left: {
					width: t.left - s.left,
					height: s.height
				}
			},
			c = Object.keys(l).map(function(e) {
				return U({
					key: e
				}, l[e], {
					area: (t = l[e]).width * t.height
				});
				var t
			}).sort(function(e, t) {
				return t.area - e.area
			}),
			u = c.filter(function(e) {
				var t = e.width,
					n = e.height;
				return t >= i.clientWidth && n >= i.clientHeight
			}),
			d = 0 < u.length ? u[0].key : c[0].key,
			f = e.split("-")[1];
		return d + (f ? "-" + f : "")
	}

	function l(e, t, n) {
		return D(n, x(t, n))
	}

	function A(e) {
		var t = getComputedStyle(e),
			n = parseFloat(t.marginTop) + parseFloat(t.marginBottom),
			i = parseFloat(t.marginLeft) + parseFloat(t.marginRight);
		return {
			width: e.offsetWidth + i,
			height: e.offsetHeight + n
		}
	}

	function k(e) {
		var t = {
			left: "right",
			right: "left",
			bottom: "top",
			top: "bottom"
		};
		return e.replace(/left|right|bottom|top/g, function(e) {
			return t[e]
		})
	}

	function N(e, t, n) {
		n = n.split("-")[0];
		var i = A(e),
			o = {
				width: i.width,
				height: i.height
			},
			r = -1 !== ["right", "left"].indexOf(n),
			a = r ? "top" : "left",
			s = r ? "left" : "top",
			l = r ? "height" : "width",
			c = r ? "width" : "height";
		return o[a] = t[a] + t[l] / 2 - i[l] / 2, o[s] = n === s ? t[s] - i[c] : t[k(s)], o
	}

	function I(e, t) {
		return Array.prototype.find ? e.find(t) : e.filter(t)[0]
	}

	function O(e, n, t) {
		return (void 0 === t ? e : e.slice(0, function(e, t, n) {
			if (Array.prototype.findIndex) return e.findIndex(function(e) {
				return e[t] === n
			});
			var i = I(e, function(e) {
				return e[t] === n
			});
			return e.indexOf(i)
		}(e, "name", t))).forEach(function(e) {
			e.function && console.warn("`modifier.function` is deprecated, use `modifier.fn`!");
			var t = e.function || e.fn;
			e.enabled && r(t) && (n.offsets.popper = T(n.offsets.popper), n.offsets.reference = T(n.offsets.reference), n = t(n, e))
		}), n
	}

	function e(e, n) {
		return e.some(function(e) {
			var t = e.name;
			return e.enabled && t === n
		})
	}

	function $(e) {
		for (var t = [!1, "ms", "Webkit", "Moz", "O"], n = e.charAt(0).toUpperCase() + e.slice(1), i = 0; i < t.length - 1; i++) {
			var o = t[i],
				r = o ? "" + o + n : e;
			if (void 0 !== document.body.style[r]) return r
		}
		return null
	}

	function a(e) {
		var t = e.ownerDocument;
		return t ? t.defaultView : window
	}

	function t(e, t, n, i) {
		n.updateBound = i, a(e).addEventListener("resize", n.updateBound, {
			passive: !0
		});
		var o = b(e);
		return function e(t, n, i, o) {
			var r = "BODY" === t.nodeName,
				a = r ? t.ownerDocument.defaultView : t;
			a.addEventListener(n, i, {
				passive: !0
			}), r || e(b(a.parentNode), n, i, o), o.push(a)
		}(o, "scroll", n.updateBound, n.scrollParents), n.scrollElement = o, n.eventsEnabled = !0, n
	}

	function n() {
		var e, t;
		this.state.eventsEnabled && (cancelAnimationFrame(this.scheduleUpdate), this.state = (e = this.reference, t = this.state, a(e).removeEventListener("resize", t.updateBound), t.scrollParents.forEach(function(e) {
			e.removeEventListener("scroll", t.updateBound)
		}), t.updateBound = null, t.scrollParents = [], t.scrollElement = null, t.eventsEnabled = !1, t))
	}

	function f(e) {
		return "" !== e && !isNaN(parseFloat(e)) && isFinite(e)
	}

	function c(n, i) {
		Object.keys(i).forEach(function(e) {
			var t = ""; - 1 !== ["width", "height", "top", "right", "bottom", "left"].indexOf(e) && f(i[e]) && (t = "px"), n.style[e] = i[e] + t
		})
	}

	function j(e, t, n) {
		var i = I(e, function(e) {
				return e.name === t
			}),
			o = !!i && e.some(function(e) {
				return e.name === n && e.enabled && e.order < i.order
			});
		if (!o) {
			var r = "`" + t + "`";
			console.warn("`" + n + "` modifier is required by " + r + " modifier in order to work, be sure to include it before " + r + "!")
		}
		return o
	}

	function o(e, t) {
		var n = 1 < arguments.length && void 0 !== t && t,
			i = V.indexOf(e),
			o = V.slice(i + 1).concat(V.slice(0, i));
		return n ? o.reverse() : o
	}

	function p(e, o, r, t) {
		var a = [0, 0],
			s = -1 !== ["right", "left"].indexOf(t),
			n = e.split(/(\+|\-)/).map(function(e) {
				return e.trim()
			}),
			i = n.indexOf(I(n, function(e) {
				return -1 !== e.search(/,|\s/)
			}));
		n[i] && -1 === n[i].indexOf(",") && console.warn("Offsets separated by white space(s) are deprecated, use a comma (,) instead.");
		var l = /\s*,\s*|\s+/,
			c = -1 === i ? [n] : [n.slice(0, i).concat([n[i].split(l)[0]]), [n[i].split(l)[1]].concat(n.slice(i + 1))];
		return (c = c.map(function(e, t) {
			var n = (1 === t ? !s : s) ? "height" : "width",
				i = !1;
			return e.reduce(function(e, t) {
				return "" === e[e.length - 1] && -1 !== ["+", "-"].indexOf(t) ? (e[e.length - 1] = t, i = !0, e) : i ? (e[e.length - 1] += t, i = !1, e) : e.concat(t)
			}, []).map(function(e) {
				return function(e, t, n, i) {
					var o, r = e.match(/((?:\-|\+)?\d*\.?\d*)(.*)/),
						a = +r[1],
						s = r[2];
					if (!a) return e;
					if (0 !== s.indexOf("%")) return "vh" !== s && "vw" !== s ? a : ("vh" === s ? M(document.documentElement.clientHeight, window.innerHeight || 0) : M(document.documentElement.clientWidth, window.innerWidth || 0)) / 100 * a;
					switch (s) {
						case "%p":
							o = n;
							break;
						case "%":
						case "%r":
						default:
							o = i
					}
					return T(o)[t] / 100 * a
				}(e, n, o, r)
			})
		})).forEach(function(n, i) {
			n.forEach(function(e, t) {
				f(e) && (a[i] += e * ("-" === n[t - 1] ? -1 : 1))
			})
		}), a
	}
	for (var P = Math.min, L = Math.floor, M = Math.max, m = "undefined" != typeof window && "undefined" != typeof document, g = ["Edge", "Trident", "Firefox"], v = 0, H = 0; H < g.length; H += 1)
		if (m && 0 <= navigator.userAgent.indexOf(g[H])) {
			v = 1;
			break
		}
	function R(e, t, n) {
		return t in e ? Object.defineProperty(e, t, {
			value: n,
			enumerable: !0,
			configurable: !0,
			writable: !0
		}) : e[t] = n, e
	}
	var q, F = m && window.Promise ? function(e) {
			var t = !1;
			return function() {
				t || (t = !0, window.Promise.resolve().then(function() {
					t = !1, e()
				}))
			}
		} : function(e) {
			var t = !1;
			return function() {
				t || (t = !0, setTimeout(function() {
					t = !1, e()
				}, v))
			}
		},
		W = function() {
			return null == q && (q = -1 !== navigator.appVersion.indexOf("MSIE 10")), q
		},
		B = function(e, t, n) {
			return t && J(e.prototype, t), n && J(e, n), e
		},
		U = Object.assign || function(e) {
			for (var t, n = 1; n < arguments.length; n++)
				for (var i in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
			return e
		},
		K = ["auto-start", "auto", "auto-end", "top-start", "top", "top-end", "right-start", "right", "right-end", "bottom-end", "bottom", "bottom-start", "left-end", "left", "left-start"],
		V = K.slice(3),
		X = "flip",
		Y = "clockwise",
		z = "counterclockwise",
		Q = (B(G, [{
			key: "update",
			value: function() {
				return function() {
					if (!this.state.isDestroyed) {
						var e = {
							instance: this,
							styles: {},
							arrowStyles: {},
							attributes: {},
							flipped: !1,
							offsets: {}
						};
						e.offsets.reference = l(this.state, this.popper, this.reference), e.placement = s(this.options.placement, e.offsets.reference, this.popper, this.reference, this.options.modifiers.flip.boundariesElement, this.options.modifiers.flip.padding), e.originalPlacement = e.placement, e.offsets.popper = N(this.popper, e.offsets.reference, e.placement), e.offsets.popper.position = "absolute", e = O(this.modifiers, e), this.state.isCreated ? this.options.onUpdate(e) : (this.state.isCreated = !0, this.options.onCreate(e))
					}
				}.call(this)
			}
		}, {
			key: "destroy",
			value: function() {
				return function() {
					return this.state.isDestroyed = !0, e(this.modifiers, "applyStyle") && (this.popper.removeAttribute("x-placement"), this.popper.style.left = "", this.popper.style.position = "", this.popper.style.top = "", this.popper.style[$("transform")] = ""), this.disableEventListeners(), this.options.removeOnDestroy && this.popper.parentNode.removeChild(this.popper), this
				}.call(this)
			}
		}, {
			key: "enableEventListeners",
			value: function() {
				return function() {
					this.state.eventsEnabled || (this.state = t(this.reference, this.options, this.state, this.scheduleUpdate))
				}.call(this)
			}
		}, {
			key: "disableEventListeners",
			value: function() {
				return n.call(this)
			}
		}]), G);

	function G(e, t) {
		var n = this,
			i = 2 < arguments.length && void 0 !== arguments[2] ? arguments[2] : {};
		(function(e, t) {
			if (!(e instanceof t)) throw new TypeError("Cannot call a class as a function")
		})(this, G), this.scheduleUpdate = function() {
			return requestAnimationFrame(n.update)
		}, this.update = F(this.update.bind(this)), this.options = U({}, G.Defaults, i), this.state = {
			isDestroyed: !1,
			isCreated: !1,
			scrollParents: []
		}, this.reference = e && e.jquery ? e[0] : e, this.popper = t && t.jquery ? t[0] : t, this.options.modifiers = {}, Object.keys(U({}, G.Defaults.modifiers, i.modifiers)).forEach(function(e) {
			n.options.modifiers[e] = U({}, G.Defaults.modifiers[e] || {}, i.modifiers ? i.modifiers[e] : {})
		}), this.modifiers = Object.keys(this.options.modifiers).map(function(e) {
			return U({
				name: e
			}, n.options.modifiers[e])
		}).sort(function(e, t) {
			return e.order - t.order
		}), this.modifiers.forEach(function(e) {
			e.enabled && r(e.onLoad) && e.onLoad(n.reference, n.popper, n.options, e, n.state)
		}), this.update();
		var o = this.options.eventsEnabled;
		o && this.enableEventListeners(), this.state.eventsEnabled = o
	}

	function J(e, t) {
		for (var n, i = 0; i < t.length; i++)(n = t[i]).enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
	}
	return Q.Utils = ("undefined" == typeof window ? global : window).PopperUtils, Q.placements = K, Q.Defaults = {
		placement: "bottom",
		eventsEnabled: !0,
		removeOnDestroy: !1,
		onCreate: function() {},
		onUpdate: function() {},
		modifiers: {
			shift: {
				order: 100,
				enabled: !0,
				fn: function(e) {
					var t = e.placement,
						n = t.split("-")[0],
						i = t.split("-")[1];
					if (i) {
						var o = e.offsets,
							r = o.reference,
							a = o.popper,
							s = -1 !== ["bottom", "top"].indexOf(n),
							l = s ? "left" : "top",
							c = s ? "width" : "height",
							u = {
								start: R({}, l, r[l]),
								end: R({}, l, r[l] + r[c] - a[c])
							};
						e.offsets.popper = U({}, a, u[i])
					}
					return e
				}
			},
			offset: {
				order: 200,
				enabled: !0,
				fn: function(e, t) {
					var n, i = t.offset,
						o = e.placement,
						r = e.offsets,
						a = r.popper,
						s = r.reference,
						l = o.split("-")[0];
					return n = f(+i) ? [+i, 0] : p(i, a, s, l), "left" === l ? (a.top += n[0], a.left -= n[1]) : "right" === l ? (a.top += n[0], a.left += n[1]) : "top" === l ? (a.left += n[0], a.top -= n[1]) : "bottom" === l && (a.left += n[0], a.top += n[1]), e.popper = a, e
				},
				offset: 0
			},
			preventOverflow: {
				order: 300,
				enabled: !0,
				fn: function(e, i) {
					var t = i.boundariesElement || _(e.instance.popper);
					e.instance.reference === t && (t = _(t));
					var o = h(e.instance.popper, e.instance.reference, i.padding, t);
					i.boundaries = o;
					var n = i.priority,
						r = e.offsets.popper,
						a = {
							primary: function(e) {
								var t = r[e];
								return r[e] < o[e] && !i.escapeWithReference && (t = M(r[e], o[e])), R({}, e, t)
							},
							secondary: function(e) {
								var t = "right" === e ? "left" : "top",
									n = r[t];
								return r[e] > o[e] && !i.escapeWithReference && (n = P(r[t], o[e] - ("right" === e ? r.width : r.height))), R({}, t, n)
							}
						};
					return n.forEach(function(e) {
						var t = -1 === ["left", "top"].indexOf(e) ? "secondary" : "primary";
						r = U({}, r, a[t](e))
					}), e.offsets.popper = r, e
				},
				priority: ["left", "right", "top", "bottom"],
				padding: 5,
				boundariesElement: "scrollParent"
			},
			keepTogether: {
				order: 400,
				enabled: !0,
				fn: function(e) {
					var t = e.offsets,
						n = t.popper,
						i = t.reference,
						o = e.placement.split("-")[0],
						r = L,
						a = -1 !== ["top", "bottom"].indexOf(o),
						s = a ? "right" : "bottom",
						l = a ? "left" : "top",
						c = a ? "width" : "height";
					return n[s] < r(i[l]) && (e.offsets.popper[l] = r(i[l]) - n[c]), n[l] > r(i[s]) && (e.offsets.popper[l] = r(i[s])), e
				}
			},
			arrow: {
				order: 500,
				enabled: !0,
				fn: function(e, t) {
					var n;
					if (!j(e.instance.modifiers, "arrow", "keepTogether")) return e;
					var i = t.element;
					if ("string" == typeof i) {
						if (!(i = e.instance.popper.querySelector(i))) return e
					} else if (!e.instance.popper.contains(i)) return console.warn("WARNING: `arrow.element` must be child of its popper element!"), e;
					var o = e.placement.split("-")[0],
						r = e.offsets,
						a = r.popper,
						s = r.reference,
						l = -1 !== ["left", "right"].indexOf(o),
						c = l ? "height" : "width",
						u = l ? "Top" : "Left",
						d = u.toLowerCase(),
						f = l ? "left" : "top",
						h = l ? "bottom" : "right",
						p = A(i)[c];
					s[h] - p < a[d] && (e.offsets.popper[d] -= a[d] - (s[h] - p)), s[d] + p > a[h] && (e.offsets.popper[d] += s[d] + p - a[h]), e.offsets.popper = T(e.offsets.popper);
					var m = s[d] + s[c] / 2 - p / 2,
						g = w(e.instance.popper),
						v = parseFloat(g["margin" + u], 10),
						y = parseFloat(g["border" + u + "Width"], 10),
						b = m - e.offsets.popper[d] - v - y;
					return b = M(P(a[c] - p, b), 0), e.arrowElement = i, e.offsets.arrow = (R(n = {}, d, Math.round(b)), R(n, f, ""), n), e
				},
				element: "[x-arrow]"
			},
			flip: {
				order: 600,
				enabled: !0,
				fn: function(p, m) {
					if (e(p.instance.modifiers, "inner")) return p;
					if (p.flipped && p.placement === p.originalPlacement) return p;
					var g = h(p.instance.popper, p.instance.reference, m.padding, m.boundariesElement),
						v = p.placement.split("-")[0],
						y = k(v),
						b = p.placement.split("-")[1] || "",
						w = [];
					switch (m.behavior) {
						case X:
							w = [v, y];
							break;
						case Y:
							w = o(v);
							break;
						case z:
							w = o(v, !0);
							break;
						default:
							w = m.behavior
					}
					return w.forEach(function(e, t) {
						if (v !== e || w.length === t + 1) return p;
						v = p.placement.split("-")[0], y = k(v);
						var n, i = p.offsets.popper,
							o = p.offsets.reference,
							r = L,
							a = "left" === v && r(i.right) > r(o.left) || "right" === v && r(i.left) < r(o.right) || "top" === v && r(i.bottom) > r(o.top) || "bottom" === v && r(i.top) < r(o.bottom),
							s = r(i.left) < r(g.left),
							l = r(i.right) > r(g.right),
							c = r(i.top) < r(g.top),
							u = r(i.bottom) > r(g.bottom),
							d = "left" === v && s || "right" === v && l || "top" === v && c || "bottom" === v && u,
							f = -1 !== ["top", "bottom"].indexOf(v),
							h = !!m.flipVariations && (f && "start" === b && s || f && "end" === b && l || !f && "start" === b && c || !f && "end" === b && u);
						(a || d || h) && (p.flipped = !0, (a || d) && (v = w[t + 1]), h && (b = "end" === (n = b) ? "start" : "start" === n ? "end" : n), p.placement = v + (b ? "-" + b : ""), p.offsets.popper = U({}, p.offsets.popper, N(p.instance.popper, p.offsets.reference, p.placement)), p = O(p.instance.modifiers, p, "flip"))
					}), p
				},
				behavior: "flip",
				padding: 5,
				boundariesElement: "viewport"
			},
			inner: {
				order: 700,
				enabled: !1,
				fn: function(e) {
					var t = e.placement,
						n = t.split("-")[0],
						i = e.offsets,
						o = i.popper,
						r = i.reference,
						a = -1 !== ["left", "right"].indexOf(n),
						s = -1 === ["top", "left"].indexOf(n);
					return o[a ? "left" : "top"] = r[n] - (s ? o[a ? "width" : "height"] : 0), e.placement = k(t), e.offsets.popper = T(o), e
				}
			},
			hide: {
				order: 800,
				enabled: !0,
				fn: function(e) {
					if (!j(e.instance.modifiers, "hide", "preventOverflow")) return e;
					var t = e.offsets.reference,
						n = I(e.instance.modifiers, function(e) {
							return "preventOverflow" === e.name
						}).boundaries;
					if (t.bottom < n.top || t.left > n.right || t.top > n.bottom || t.right < n.left) {
						if (!0 === e.hide) return e;
						e.hide = !0, e.attributes["x-out-of-boundaries"] = ""
					} else {
						if (!1 === e.hide) return e;
						e.hide = !1, e.attributes["x-out-of-boundaries"] = !1
					}
					return e
				}
			},
			computeStyle: {
				order: 850,
				enabled: !0,
				fn: function(e, t) {
					var n = t.x,
						i = t.y,
						o = e.offsets.popper,
						r = I(e.instance.modifiers, function(e) {
							return "applyStyle" === e.name
						}).gpuAcceleration;
					void 0 !== r && console.warn("WARNING: `gpuAcceleration` option moved to `computeStyle` modifier and will not be supported in future versions of Popper.js!");
					var a, s, l = void 0 === r ? t.gpuAcceleration : r,
						c = S(_(e.instance.popper)),
						u = {
							position: o.position
						},
						d = {
							left: L(o.left),
							top: L(o.top),
							bottom: L(o.bottom),
							right: L(o.right)
						},
						f = "bottom" === n ? "top" : "bottom",
						h = "right" === i ? "left" : "right",
						p = $("transform");
					if (s = "bottom" == f ? -c.height + d.bottom : d.top, a = "right" == h ? -c.width + d.right : d.left, l && p) u[p] = "translate3d(" + a + "px, " + s + "px, 0)", u[f] = 0, u[h] = 0, u.willChange = "transform";
					else {
						var m = "bottom" == f ? -1 : 1,
							g = "right" == h ? -1 : 1;
						u[f] = s * m, u[h] = a * g, u.willChange = f + ", " + h
					}
					var v = {
						"x-placement": e.placement
					};
					return e.attributes = U({}, v, e.attributes), e.styles = U({}, u, e.styles), e.arrowStyles = U({}, e.offsets.arrow, e.arrowStyles), e
				},
				gpuAcceleration: !0,
				x: "bottom",
				y: "right"
			},
			applyStyle: {
				order: 900,
				enabled: !0,
				fn: function(e) {
					return c(e.instance.popper, e.styles), t = e.instance.popper, n = e.attributes, Object.keys(n).forEach(function(e) {
						!1 === n[e] ? t.removeAttribute(e) : t.setAttribute(e, n[e])
					}), e.arrowElement && Object.keys(e.arrowStyles).length && c(e.arrowElement, e.arrowStyles), e;
					var t, n
				},
				onLoad: function(e, t, n, i, o) {
					var r = l(0, t, e),
						a = s(n.placement, r, t, e, n.modifiers.flip.boundariesElement, n.modifiers.flip.padding);
					return t.setAttribute("x-placement", a), c(t, {
						position: "absolute"
					}), n
				},
				gpuAcceleration: void 0
			}
		}
	}, Q
}),
function(e, t) {
	"object" == typeof exports && "undefined" != typeof module ? t(exports, require("jquery"), require("popper.js")) : "function" == typeof define && define.amd ? define(["exports", "jquery", "popper.js"], t) : t(e.bootstrap = {}, e.jQuery, e.Popper)
}(this, function(e, t, c) {
	"use strict";

	function i(e, t) {
		for (var n = 0; n < t.length; n++) {
			var i = t[n];
			i.enumerable = i.enumerable || !1, i.configurable = !0, "value" in i && (i.writable = !0), Object.defineProperty(e, i.key, i)
		}
	}

	function r(e, t, n) {
		return t && i(e.prototype, t), n && i(e, n), e
	}

	function a() {
		return (a = Object.assign || function(e) {
			for (var t = 1; t < arguments.length; t++) {
				var n = arguments[t];
				for (var i in n) Object.prototype.hasOwnProperty.call(n, i) && (e[i] = n[i])
			}
			return e
		}).apply(this, arguments)
	}
	t = t && t.hasOwnProperty("default") ? t.default : t, c = c && c.hasOwnProperty("default") ? c.default : c;
	var o, n, s, l, u, d, f, h, p, m, g, v, y, b, w, _, x, E, C, T, S, D, A, k, N, I, O, $, j, P, L, M, H, R, q, F, W, B, U, K, V, X, Y, z, Q, G, J, Z, ee, te, ne, ie, oe, re, ae, se, le, ce, ue, de, fe, he, pe, me, ge, ve, ye, be, we, _e, xe, Ee, Ce, Te, Se, De, Ae, ke, Ne, Ie, Oe, $e, je, Pe, Le, Me, He, Re, qe, Fe, We, Be, Ue, Ke, Ve, Xe, Ye, ze, Qe, Ge, Je, Ze, et, tt, nt, it, ot, rt, at, st, lt, ct, ut, dt, ft, ht, pt, mt, gt, vt, yt, bt, wt, _t, xt, Et, Ct, Tt, St, Dt, At, kt, Nt, It, Ot, $t, jt, Pt, Lt, Mt, Ht, Rt, qt, Ft, Wt, Bt, Ut, Kt, Vt, Xt, Yt, zt = (Vt = t, Xt = !1, Yt = {
			TRANSITION_END: "bsTransitionEnd",
			getUID: function(e) {
				for (; e += ~~(1e6 * Math.random()), document.getElementById(e););
				return e
			},
			getSelectorFromElement: function(e) {
				var t, n = e.getAttribute("data-target");
				n && "#" !== n || (n = e.getAttribute("href") || ""), "#" === n.charAt(0) && (t = n, n = t = "function" == typeof Vt.escapeSelector ? Vt.escapeSelector(t).substr(1) : t.replace(/(:|\.|\[|\]|,|=|@)/g, "\\$1"));
				try {
					return 0 < Vt(document).find(n).length ? n : null
				} catch (e) {
					return null
				}
			},
			reflow: function(e) {
				return e.offsetHeight
			},
			triggerTransitionEnd: function(e) {
				Vt(e).trigger(Xt.end)
			},
			supportsTransitionEnd: function() {
				return Boolean(Xt)
			},
			isElement: function(e) {
				return (e[0] || e).nodeType
			},
			typeCheckConfig: function(e, t, n) {
				for (var i in n)
					if (Object.prototype.hasOwnProperty.call(n, i)) {
						var o = n[i],
							r = t[i],
							a = r && Yt.isElement(r) ? "element" : {}.toString.call(r).match(/\s([a-zA-Z]+)/)[1].toLowerCase();
						if (!new RegExp(o).test(a)) throw new Error(e.toUpperCase() + ': Option "' + i + '" provided type "' + a + '" but expected type "' + o + '".')
					}
			}
		}, Xt = ("undefined" == typeof window || !window.QUnit) && {
			end: "transitionend"
		}, Vt.fn.emulateTransitionEnd = function(e) {
			var t = this,
				n = !1;
			return Vt(this).one(Yt.TRANSITION_END, function() {
				n = !0
			}), setTimeout(function() {
				n || Yt.triggerTransitionEnd(t)
			}, e), this
		}, Yt.supportsTransitionEnd() && (Vt.event.special[Yt.TRANSITION_END] = {
			bindType: Xt.end,
			delegateType: Xt.end,
			handle: function(e) {
				if (Vt(e.target).is(this)) return e.handleObj.handler.apply(this, arguments)
			}
		}), Yt),
		Qt = (n = "alert", l = "." + (s = "bs.alert"), u = (o = t).fn[n], d = {
			CLOSE: "close" + l,
			CLOSED: "closed" + l,
			CLICK_DATA_API: "click" + l + ".data-api"
		}, (Kt = mn.prototype).close = function(e) {
			e = e || this._element;
			var t = this._getRootElement(e);
			this._triggerCloseEvent(t).isDefaultPrevented() || this._removeElement(t)
		}, Kt.dispose = function() {
			o.removeData(this._element, s), this._element = null
		}, Kt._getRootElement = function(e) {
			var t = zt.getSelectorFromElement(e),
				n = !1;
			return t && (n = o(t)[0]), n = n || o(e).closest(".alert")[0]
		}, Kt._triggerCloseEvent = function(e) {
			var t = o.Event(d.CLOSE);
			return o(e).trigger(t), t
		}, Kt._removeElement = function(t) {
			var n = this;
			o(t).removeClass("show"), zt.supportsTransitionEnd() && o(t).hasClass("fade") ? o(t).one(zt.TRANSITION_END, function(e) {
				return n._destroyElement(t, e)
			}).emulateTransitionEnd(150) : this._destroyElement(t)
		}, Kt._destroyElement = function(e) {
			o(e).detach().trigger(d.CLOSED).remove()
		}, mn._jQueryInterface = function(n) {
			return this.each(function() {
				var e = o(this),
					t = e.data(s);
				t || (t = new mn(this), e.data(s, t)), "close" === n && t[n](this)
			})
		}, mn._handleDismiss = function(t) {
			return function(e) {
				e && e.preventDefault(), t.close(this)
			}
		}, r(mn, null, [{
			key: "VERSION",
			get: function() {
				return "4.0.0"
			}
		}]), f = mn, o(document).on(d.CLICK_DATA_API, '[data-dismiss="alert"]', f._handleDismiss(new f)), o.fn[n] = f._jQueryInterface, o.fn[n].Constructor = f, o.fn[n].noConflict = function() {
			return o.fn[n] = u, f._jQueryInterface
		}, f),
		Gt = (p = "button", g = "." + (m = "bs.button"), v = ".data-api", y = (h = t).fn[p], b = "active", w = '[data-toggle^="button"]', _ = {
			CLICK_DATA_API: "click" + g + v,
			FOCUS_BLUR_DATA_API: "focus" + g + v + " blur" + g + v
		}, (Ut = pn.prototype).toggle = function() {
			var e = !0,
				t = !0,
				n = h(this._element).closest('[data-toggle="buttons"]')[0];
			if (n) {
				var i = h(this._element).find("input")[0];
				if (i) {
					if ("radio" === i.type)
						if (i.checked && h(this._element).hasClass(b)) e = !1;
						else {
							var o = h(n).find(".active")[0];
							o && h(o).removeClass(b)
						}
					if (e) {
						if (i.hasAttribute("disabled") || n.hasAttribute("disabled") || i.classList.contains("disabled") || n.classList.contains("disabled")) return;
						i.checked = !h(this._element).hasClass(b), h(i).trigger("change")
					}
					i.focus(), t = !1
				}
			}
			t && this._element.setAttribute("aria-pressed", !h(this._element).hasClass(b)), e && h(this._element).toggleClass(b)
		}, Ut.dispose = function() {
			h.removeData(this._element, m), this._element = null
		}, pn._jQueryInterface = function(t) {
			return this.each(function() {
				var e = h(this).data(m);
				e || (e = new pn(this), h(this).data(m, e)), "toggle" === t && e[t]()
			})
		}, r(pn, null, [{
			key: "VERSION",
			get: function() {
				return "4.0.0"
			}
		}]), x = pn, h(document).on(_.CLICK_DATA_API, w, function(e) {
			e.preventDefault();
			var t = e.target;
			h(t).hasClass("btn") || (t = h(t).closest(".btn")), x._jQueryInterface.call(h(t), "toggle")
		}).on(_.FOCUS_BLUR_DATA_API, w, function(e) {
			var t = h(e.target).closest(".btn")[0];
			h(t).toggleClass("focus", /^focus(in)?$/.test(e.type))
		}), h.fn[p] = x._jQueryInterface, h.fn[p].Constructor = x, h.fn[p].noConflict = function() {
			return h.fn[p] = y, x._jQueryInterface
		}, x),
		Jt = (St = "carousel", At = "." + (Dt = "bs.carousel"), kt = (Ct = t).fn[St], Nt = {
			interval: 5e3,
			keyboard: !0,
			slide: !1,
			pause: "hover",
			wrap: !0
		}, It = {
			interval: "(number|boolean)",
			keyboard: "boolean",
			slide: "(boolean|string)",
			pause: "(string|boolean)",
			wrap: "boolean"
		}, Ot = "next", $t = "prev", jt = {
			SLIDE: "slide" + At,
			SLID: "slid" + At,
			KEYDOWN: "keydown" + At,
			MOUSEENTER: "mouseenter" + At,
			MOUSELEAVE: "mouseleave" + At,
			TOUCHEND: "touchend" + At,
			LOAD_DATA_API: "load" + At + ".data-api",
			CLICK_DATA_API: "click" + At + ".data-api"
		}, Pt = "active", Lt = ".active", Mt = ".active.carousel-item", Ht = ".carousel-item", Rt = ".carousel-item-next, .carousel-item-prev", qt = ".carousel-indicators", Ft = "[data-slide], [data-slide-to]", Wt = '[data-ride="carousel"]', (Tt = hn.prototype).next = function() {
			this._isSliding || this._slide(Ot)
		}, Tt.nextWhenVisible = function() {
			!document.hidden && Ct(this._element).is(":visible") && "hidden" !== Ct(this._element).css("visibility") && this.next()
		}, Tt.prev = function() {
			this._isSliding || this._slide($t)
		}, Tt.pause = function(e) {
			e || (this._isPaused = !0), Ct(this._element).find(Rt)[0] && zt.supportsTransitionEnd() && (zt.triggerTransitionEnd(this._element), this.cycle(!0)), clearInterval(this._interval), this._interval = null
		}, Tt.cycle = function(e) {
			e || (this._isPaused = !1), this._interval && (clearInterval(this._interval), this._interval = null), this._config.interval && !this._isPaused && (this._interval = setInterval((document.visibilityState ? this.nextWhenVisible : this.next).bind(this), this._config.interval))
		}, Tt.to = function(e) {
			var t = this;
			this._activeElement = Ct(this._element).find(Mt)[0];
			var n = this._getItemIndex(this._activeElement);
			if (!(e > this._items.length - 1 || e < 0))
				if (this._isSliding) Ct(this._element).one(jt.SLID, function() {
					return t.to(e)
				});
				else {
					if (n === e) return this.pause(), void this.cycle();
					var i = n < e ? Ot : $t;
					this._slide(i, this._items[e])
				}
		}, Tt.dispose = function() {
			Ct(this._element).off(At), Ct.removeData(this._element, Dt), this._items = null, this._config = null, this._element = null, this._interval = null, this._isPaused = null, this._isSliding = null, this._activeElement = null, this._indicatorsElement = null
		}, Tt._getConfig = function(e) {
			return e = a({}, Nt, e), zt.typeCheckConfig(St, e, It), e
		}, Tt._addEventListeners = function() {
			var t = this;
			this._config.keyboard && Ct(this._element).on(jt.KEYDOWN, function(e) {
				return t._keydown(e)
			}), "hover" === this._config.pause && (Ct(this._element).on(jt.MOUSEENTER, function(e) {
				return t.pause(e)
			}).on(jt.MOUSELEAVE, function(e) {
				return t.cycle(e)
			}), "ontouchstart" in document.documentElement && Ct(this._element).on(jt.TOUCHEND, function() {
				t.pause(), t.touchTimeout && clearTimeout(t.touchTimeout), t.touchTimeout = setTimeout(function(e) {
					return t.cycle(e)
				}, 500 + t._config.interval)
			}))
		}, Tt._keydown = function(e) {
			if (!/input|textarea/i.test(e.target.tagName)) switch (e.which) {
				case 37:
					e.preventDefault(), this.prev();
					break;
				case 39:
					e.preventDefault(), this.next()
			}
		}, Tt._getItemIndex = function(e) {
			return this._items = Ct.makeArray(Ct(e).parent().find(Ht)), this._items.indexOf(e)
		}, Tt._getItemByDirection = function(e, t) {
			var n = e === Ot,
				i = e === $t,
				o = this._getItemIndex(t),
				r = this._items.length - 1;
			if ((i && 0 === o || n && o === r) && !this._config.wrap) return t;
			var a = (o + (e === $t ? -1 : 1)) % this._items.length;
			return -1 == a ? this._items[this._items.length - 1] : this._items[a]
		}, Tt._triggerSlideEvent = function(e, t) {
			var n = this._getItemIndex(e),
				i = this._getItemIndex(Ct(this._element).find(Mt)[0]),
				o = Ct.Event(jt.SLIDE, {
					relatedTarget: e,
					direction: t,
					from: i,
					to: n
				});
			return Ct(this._element).trigger(o), o
		}, Tt._setActiveIndicatorElement = function(e) {
			if (this._indicatorsElement) {
				Ct(this._indicatorsElement).find(Lt).removeClass(Pt);
				var t = this._indicatorsElement.children[this._getItemIndex(e)];
				t && Ct(t).addClass(Pt)
			}
		}, Tt._slide = function(e, t) {
			var n, i, o, r = this,
				a = Ct(this._element).find(Mt)[0],
				s = this._getItemIndex(a),
				l = t || a && this._getItemByDirection(e, a),
				c = this._getItemIndex(l),
				u = Boolean(this._interval);
			if (o = e === Ot ? (n = "carousel-item-left", i = "carousel-item-next", "left") : (n = "carousel-item-right", i = "carousel-item-prev", "right"), l && Ct(l).hasClass(Pt)) this._isSliding = !1;
			else if (!this._triggerSlideEvent(l, o).isDefaultPrevented() && a && l) {
				this._isSliding = !0, u && this.pause(), this._setActiveIndicatorElement(l);
				var d = Ct.Event(jt.SLID, {
					relatedTarget: l,
					direction: o,
					from: s,
					to: c
				});
				zt.supportsTransitionEnd() && Ct(this._element).hasClass("slide") ? (Ct(l).addClass(i), zt.reflow(l), Ct(a).addClass(n), Ct(l).addClass(n), Ct(a).one(zt.TRANSITION_END, function() {
					Ct(l).removeClass(n + " " + i).addClass(Pt), Ct(a).removeClass(Pt + " " + i + " " + n), r._isSliding = !1, setTimeout(function() {
						return Ct(r._element).trigger(d)
					}, 0)
				}).emulateTransitionEnd(600)) : (Ct(a).removeClass(Pt), Ct(l).addClass(Pt), this._isSliding = !1, Ct(this._element).trigger(d)), u && this.cycle()
			}
		}, hn._jQueryInterface = function(i) {
			return this.each(function() {
				var e = Ct(this).data(Dt),
					t = a({}, Nt, Ct(this).data());
				"object" == typeof i && (t = a({}, t, i));
				var n = "string" == typeof i ? i : t.slide;
				if (e || (e = new hn(this, t), Ct(this).data(Dt, e)), "number" == typeof i) e.to(i);
				else if ("string" == typeof n) {
					if (void 0 === e[n]) throw new TypeError('No method named "' + n + '"');
					e[n]()
				} else t.interval && (e.pause(), e.cycle())
			})
		}, hn._dataApiClickHandler = function(e) {
			var t = zt.getSelectorFromElement(this);
			if (t) {
				var n = Ct(t)[0];
				if (n && Ct(n).hasClass("carousel")) {
					var i = a({}, Ct(n).data(), Ct(this).data()),
						o = this.getAttribute("data-slide-to");
					o && (i.interval = !1), hn._jQueryInterface.call(Ct(n), i), o && Ct(n).data(Dt).to(o), e.preventDefault()
				}
			}
		}, r(hn, null, [{
			key: "VERSION",
			get: function() {
				return "4.0.0"
			}
		}, {
			key: "Default",
			get: function() {
				return Nt
			}
		}]), Bt = hn, Ct(document).on(jt.CLICK_DATA_API, Ft, Bt._dataApiClickHandler), Ct(window).on(jt.LOAD_DATA_API, function() {
			Ct(Wt).each(function() {
				var e = Ct(this);
				Bt._jQueryInterface.call(e, e.data())
			})
		}), Ct.fn[St] = Bt._jQueryInterface, Ct.fn[St].Constructor = Bt, Ct.fn[St].noConflict = function() {
			return Ct.fn[St] = kt, Bt._jQueryInterface
		}, Bt),
		Zt = (ut = "collapse", ft = "." + (dt = "bs.collapse"), ht = (lt = t).fn[ut], pt = {
			toggle: !0,
			parent: ""
		}, mt = {
			toggle: "boolean",
			parent: "(string|element)"
		}, gt = {
			SHOW: "show" + ft,
			SHOWN: "shown" + ft,
			HIDE: "hide" + ft,
			HIDDEN: "hidden" + ft,
			CLICK_DATA_API: "click" + ft + ".data-api"
		}, vt = "show", yt = "collapse", bt = "collapsing", wt = "collapsed", _t = ".show, .collapsing", xt = '[data-toggle="collapse"]', (ct = fn.prototype).toggle = function() {
			lt(this._element).hasClass(vt) ? this.hide() : this.show()
		}, ct.show = function() {
			var e, t, n = this;
			if (!(this._isTransitioning || lt(this._element).hasClass(vt) || (this._parent && 0 === (e = lt.makeArray(lt(this._parent).find(_t).filter('[data-parent="' + this._config.parent + '"]'))).length && (e = null), e && (t = lt(e).not(this._selector).data(dt)) && t._isTransitioning))) {
				var i = lt.Event(gt.SHOW);
				if (lt(this._element).trigger(i), !i.isDefaultPrevented()) {
					e && (fn._jQueryInterface.call(lt(e).not(this._selector), "hide"), t || lt(e).data(dt, null));
					var o = this._getDimension();
					lt(this._element).removeClass(yt).addClass(bt), (this._element.style[o] = 0) < this._triggerArray.length && lt(this._triggerArray).removeClass(wt).attr("aria-expanded", !0), this.setTransitioning(!0);
					var r = function() {
						lt(n._element).removeClass(bt).addClass(yt).addClass(vt), n._element.style[o] = "", n.setTransitioning(!1), lt(n._element).trigger(gt.SHOWN)
					};
					if (zt.supportsTransitionEnd()) {
						var a = "scroll" + (o[0].toUpperCase() + o.slice(1));
						lt(this._element).one(zt.TRANSITION_END, r).emulateTransitionEnd(600), this._element.style[o] = this._element[a] + "px"
					} else r()
				}
			}
		}, ct.hide = function() {
			var e = this;
			if (!this._isTransitioning && lt(this._element).hasClass(vt)) {
				var t = lt.Event(gt.HIDE);
				if (lt(this._element).trigger(t), !t.isDefaultPrevented()) {
					var n = this._getDimension();
					if (this._element.style[n] = this._element.getBoundingClientRect()[n] + "px", zt.reflow(this._element), lt(this._element).addClass(bt).removeClass(yt).removeClass(vt), 0 < this._triggerArray.length)
						for (var i = 0; i < this._triggerArray.length; i++) {
							var o = this._triggerArray[i],
								r = zt.getSelectorFromElement(o);
							null !== r && (lt(r).hasClass(vt) || lt(o).addClass(wt).attr("aria-expanded", !1))
						}
					this.setTransitioning(!0);
					var a = function() {
						e.setTransitioning(!1), lt(e._element).removeClass(bt).addClass(yt).trigger(gt.HIDDEN)
					};
					this._element.style[n] = "", zt.supportsTransitionEnd() ? lt(this._element).one(zt.TRANSITION_END, a).emulateTransitionEnd(600) : a()
				}
			}
		}, ct.setTransitioning = function(e) {
			this._isTransitioning = e
		}, ct.dispose = function() {
			lt.removeData(this._element, dt), this._config = null, this._parent = null, this._element = null, this._triggerArray = null, this._isTransitioning = null
		}, ct._getConfig = function(e) {
			return (e = a({}, pt, e)).toggle = Boolean(e.toggle), zt.typeCheckConfig(ut, e, mt), e
		}, ct._getDimension = function() {
			return lt(this._element).hasClass("width") ? "width" : "height"
		}, ct._getParent = function() {
			var n = this,
				e = null;
			zt.isElement(this._config.parent) ? (e = this._config.parent, void 0 !== this._config.parent.jquery && (e = this._config.parent[0])) : e = lt(this._config.parent)[0];
			var t = '[data-toggle="collapse"][data-parent="' + this._config.parent + '"]';
			return lt(e).find(t).each(function(e, t) {
				n._addAriaAndCollapsedClass(fn._getTargetFromElement(t), [t])
			}), e
		}, ct._addAriaAndCollapsedClass = function(e, t) {
			if (e) {
				var n = lt(e).hasClass(vt);
				0 < t.length && lt(t).toggleClass(wt, !n).attr("aria-expanded", n)
			}
		}, fn._getTargetFromElement = function(e) {
			var t = zt.getSelectorFromElement(e);
			return t ? lt(t)[0] : null
		}, fn._jQueryInterface = function(i) {
			return this.each(function() {
				var e = lt(this),
					t = e.data(dt),
					n = a({}, pt, e.data(), "object" == typeof i && i);
				if (!t && n.toggle && /show|hide/.test(i) && (n.toggle = !1), t || (t = new fn(this, n), e.data(dt, t)), "string" == typeof i) {
					if (void 0 === t[i]) throw new TypeError('No method named "' + i + '"');
					t[i]()
				}
			})
		}, r(fn, null, [{
			key: "VERSION",
			get: function() {
				return "4.0.0"
			}
		}, {
			key: "Default",
			get: function() {
				return pt
			}
		}]), Et = fn, lt(document).on(gt.CLICK_DATA_API, xt, function(e) {
			"A" === e.currentTarget.tagName && e.preventDefault();
			var n = lt(this),
				t = zt.getSelectorFromElement(this);
			lt(t).each(function() {
				var e = lt(this),
					t = e.data(dt) ? "toggle" : n.data();
				Et._jQueryInterface.call(e, t)
			})
		}), lt.fn[ut] = Et._jQueryInterface, lt.fn[ut].Constructor = Et, lt.fn[ut].noConflict = function() {
			return lt.fn[ut] = ht, Et._jQueryInterface
		}, Et),
		en = (Xe = "dropdown", ze = "." + (Ye = "bs.dropdown"), Qe = ".data-api", Ge = (Ke = t).fn[Xe], Je = new RegExp("38|40|27"), Ze = {
			HIDE: "hide" + ze,
			HIDDEN: "hidden" + ze,
			SHOW: "show" + ze,
			SHOWN: "shown" + ze,
			CLICK: "click" + ze,
			CLICK_DATA_API: "click" + ze + Qe,
			KEYDOWN_DATA_API: "keydown" + ze + Qe,
			KEYUP_DATA_API: "keyup" + ze + Qe
		}, et = "disabled", tt = "show", nt = "dropdown-menu-right", it = '[data-toggle="dropdown"]', ot = ".dropdown-menu", rt = {
			offset: 0,
			flip: !0,
			boundary: "scrollParent"
		}, at = {
			offset: "(number|string|function)",
			flip: "boolean",
			boundary: "(string|element)"
		}, (Ve = dn.prototype).toggle = function() {
			if (!this._element.disabled && !Ke(this._element).hasClass(et)) {
				var e = dn._getParentFromElement(this._element),
					t = Ke(this._menu).hasClass(tt);
				if (dn._clearMenus(), !t) {
					var n = {
							relatedTarget: this._element
						},
						i = Ke.Event(Ze.SHOW, n);
					if (Ke(e).trigger(i), !i.isDefaultPrevented()) {
						if (!this._inNavbar) {
							if (void 0 === c) throw new TypeError("Bootstrap dropdown require Popper.js (https://popper.js.org)");
							var o = this._element;
							Ke(e).hasClass("dropup") && (Ke(this._menu).hasClass("dropdown-menu-left") || Ke(this._menu).hasClass(nt)) && (o = e), "scrollParent" !== this._config.boundary && Ke(e).addClass("position-static"), this._popper = new c(o, this._menu, this._getPopperConfig())
						}
						"ontouchstart" in document.documentElement && 0 === Ke(e).closest(".navbar-nav").length && Ke("body").children().on("mouseover", null, Ke.noop), this._element.focus(), this._element.setAttribute("aria-expanded", !0), Ke(this._menu).toggleClass(tt), Ke(e).toggleClass(tt).trigger(Ke.Event(Ze.SHOWN, n))
					}
				}
			}
		}, Ve.dispose = function() {
			Ke.removeData(this._element, Ye), Ke(this._element).off(ze), this._element = null, (this._menu = null) !== this._popper && (this._popper.destroy(), this._popper = null)
		}, Ve.update = function() {
			this._inNavbar = this._detectNavbar(), null !== this._popper && this._popper.scheduleUpdate()
		}, Ve._addEventListeners = function() {
			var t = this;
			Ke(this._element).on(Ze.CLICK, function(e) {
				e.preventDefault(), e.stopPropagation(), t.toggle()
			})
		}, Ve._getConfig = function(e) {
			return e = a({}, this.constructor.Default, Ke(this._element).data(), e), zt.typeCheckConfig(Xe, e, this.constructor.DefaultType), e
		}, Ve._getMenuElement = function() {
			if (!this._menu) {
				var e = dn._getParentFromElement(this._element);
				this._menu = Ke(e).find(ot)[0]
			}
			return this._menu
		}, Ve._getPlacement = function() {
			var e = Ke(this._element).parent(),
				t = "bottom-start";
			return e.hasClass("dropup") ? (t = "top-start", Ke(this._menu).hasClass(nt) && (t = "top-end")) : e.hasClass("dropright") ? t = "right-start" : e.hasClass("dropleft") ? t = "left-start" : Ke(this._menu).hasClass(nt) && (t = "bottom-end"), t
		}, Ve._detectNavbar = function() {
			return 0 < Ke(this._element).closest(".navbar").length
		}, Ve._getPopperConfig = function() {
			var t = this,
				e = {};
			return "function" == typeof this._config.offset ? e.fn = function(e) {
				return e.offsets = a({}, e.offsets, t._config.offset(e.offsets) || {}), e
			} : e.offset = this._config.offset, {
				placement: this._getPlacement(),
				modifiers: {
					offset: e,
					flip: {
						enabled: this._config.flip
					},
					preventOverflow: {
						boundariesElement: this._config.boundary
					}
				}
			}
		}, dn._jQueryInterface = function(t) {
			return this.each(function() {
				var e = Ke(this).data(Ye);
				if (e || (e = new dn(this, "object" == typeof t ? t : null), Ke(this).data(Ye, e)), "string" == typeof t) {
					if (void 0 === e[t]) throw new TypeError('No method named "' + t + '"');
					e[t]()
				}
			})
		}, dn._clearMenus = function(e) {
			if (!e || 3 !== e.which && ("keyup" !== e.type || 9 === e.which))
				for (var t = Ke.makeArray(Ke(it)), n = 0; n < t.length; n++) {
					var i = dn._getParentFromElement(t[n]),
						o = Ke(t[n]).data(Ye),
						r = {
							relatedTarget: t[n]
						};
					if (o) {
						var a = o._menu;
						if (Ke(i).hasClass(tt) && !(e && ("click" === e.type && /input|textarea/i.test(e.target.tagName) || "keyup" === e.type && 9 === e.which) && Ke.contains(i, e.target))) {
							var s = Ke.Event(Ze.HIDE, r);
							Ke(i).trigger(s), s.isDefaultPrevented() || ("ontouchstart" in document.documentElement && Ke("body").children().off("mouseover", null, Ke.noop), t[n].setAttribute("aria-expanded", "false"), Ke(a).removeClass(tt), Ke(i).removeClass(tt).trigger(Ke.Event(Ze.HIDDEN, r)))
						}
					}
				}
		}, dn._getParentFromElement = function(e) {
			var t, n = zt.getSelectorFromElement(e);
			return n && (t = Ke(n)[0]), t || e.parentNode
		}, dn._dataApiKeydownHandler = function(e) {
			if ((/input|textarea/i.test(e.target.tagName) ? !(32 === e.which || 27 !== e.which && (40 !== e.which && 38 !== e.which || Ke(e.target).closest(ot).length)) : Je.test(e.which)) && (e.preventDefault(), e.stopPropagation(), !this.disabled && !Ke(this).hasClass(et))) {
				var t = dn._getParentFromElement(this),
					n = Ke(t).hasClass(tt);
				if ((n || 27 === e.which && 32 === e.which) && (!n || 27 !== e.which && 32 !== e.which)) {
					var i = Ke(t).find(".dropdown-menu .dropdown-item:not(.disabled)").get();
					if (0 !== i.length) {
						var o = i.indexOf(e.target);
						38 === e.which && 0 < o && o--, 40 === e.which && o < i.length - 1 && o++, o < 0 && (o = 0), i[o].focus()
					}
				} else {
					if (27 === e.which) {
						var r = Ke(t).find(it)[0];
						Ke(r).trigger("focus")
					}
					Ke(this).trigger("click")
				}
			}
		}, r(dn, null, [{
			key: "VERSION",
			get: function() {
				return "4.0.0"
			}
		}, {
			key: "Default",
			get: function() {
				return rt
			}
		}, {
			key: "DefaultType",
			get: function() {
				return at
			}
		}]), st = dn, Ke(document).on(Ze.KEYDOWN_DATA_API, it, st._dataApiKeydownHandler).on(Ze.KEYDOWN_DATA_API, ot, st._dataApiKeydownHandler).on(Ze.CLICK_DATA_API + " " + Ze.KEYUP_DATA_API, st._clearMenus).on(Ze.CLICK_DATA_API, it, function(e) {
			e.preventDefault(), e.stopPropagation(), st._jQueryInterface.call(Ke(this), "toggle")
		}).on(Ze.CLICK_DATA_API, ".dropdown form", function(e) {
			e.stopPropagation()
		}), Ke.fn[Xe] = st._jQueryInterface, Ke.fn[Xe].Constructor = st, Ke.fn[Xe].noConflict = function() {
			return Ke.fn[Xe] = Ge, st._jQueryInterface
		}, st),
		tn = (Ne = "." + (ke = "bs.modal"), Ie = (De = t).fn.modal, Oe = {
			backdrop: !0,
			keyboard: !0,
			focus: !0,
			show: !0
		}, $e = {
			backdrop: "(boolean|string)",
			keyboard: "boolean",
			focus: "boolean",
			show: "boolean"
		}, je = {
			HIDE: "hide" + Ne,
			HIDDEN: "hidden" + Ne,
			SHOW: "show" + Ne,
			SHOWN: "shown" + Ne,
			FOCUSIN: "focusin" + Ne,
			RESIZE: "resize" + Ne,
			CLICK_DISMISS: "click.dismiss" + Ne,
			KEYDOWN_DISMISS: "keydown.dismiss" + Ne,
			MOUSEUP_DISMISS: "mouseup.dismiss" + Ne,
			MOUSEDOWN_DISMISS: "mousedown.dismiss" + Ne,
			CLICK_DATA_API: "click" + Ne + ".data-api"
		}, Pe = "modal-open", Le = "fade", Me = "show", He = ".modal-dialog", Re = '[data-toggle="modal"]', qe = '[data-dismiss="modal"]', Fe = ".fixed-top, .fixed-bottom, .is-fixed, .sticky-top", We = ".sticky-top", Be = ".navbar-toggler", (Ae = un.prototype).toggle = function(e) {
			return this._isShown ? this.hide() : this.show(e)
		}, Ae.show = function(e) {
			var t = this;
			if (!this._isTransitioning && !this._isShown) {
				zt.supportsTransitionEnd() && De(this._element).hasClass(Le) && (this._isTransitioning = !0);
				var n = De.Event(je.SHOW, {
					relatedTarget: e
				});
				De(this._element).trigger(n), this._isShown || n.isDefaultPrevented() || (this._isShown = !0, this._checkScrollbar(), this._setScrollbar(), this._adjustDialog(), De(document.body).addClass(Pe), this._setEscapeEvent(), this._setResizeEvent(), De(this._element).on(je.CLICK_DISMISS, qe, function(e) {
					return t.hide(e)
				}), De(this._dialog).on(je.MOUSEDOWN_DISMISS, function() {
					De(t._element).one(je.MOUSEUP_DISMISS, function(e) {
						De(e.target).is(t._element) && (t._ignoreBackdropClick = !0)
					})
				}), this._showBackdrop(function() {
					return t._showElement(e)
				}))
			}
		}, Ae.hide = function(e) {
			var t = this;
			if (e && e.preventDefault(), !this._isTransitioning && this._isShown) {
				var n = De.Event(je.HIDE);
				if (De(this._element).trigger(n), this._isShown && !n.isDefaultPrevented()) {
					this._isShown = !1;
					var i = zt.supportsTransitionEnd() && De(this._element).hasClass(Le);
					i && (this._isTransitioning = !0), this._setEscapeEvent(), this._setResizeEvent(), De(document).off(je.FOCUSIN), De(this._element).removeClass(Me), De(this._element).off(je.CLICK_DISMISS), De(this._dialog).off(je.MOUSEDOWN_DISMISS), i ? De(this._element).one(zt.TRANSITION_END, function(e) {
						return t._hideModal(e)
					}).emulateTransitionEnd(300) : this._hideModal()
				}
			}
		}, Ae.dispose = function() {
			De.removeData(this._element, ke), De(window, document, this._element, this._backdrop).off(Ne), this._config = null, this._element = null, this._dialog = null, this._backdrop = null, this._isShown = null, this._isBodyOverflowing = null, this._ignoreBackdropClick = null, this._scrollbarWidth = null
		}, Ae.handleUpdate = function() {
			this._adjustDialog()
		}, Ae._getConfig = function(e) {
			return e = a({}, Oe, e), zt.typeCheckConfig("modal", e, $e), e
		}, Ae._showElement = function(e) {
			var t = this,
				n = zt.supportsTransitionEnd() && De(this._element).hasClass(Le);

			function i() {
				t._config.focus && t._element.focus(), t._isTransitioning = !1, De(t._element).trigger(o)
			}
			this._element.parentNode && this._element.parentNode.nodeType === Node.ELEMENT_NODE || document.body.appendChild(this._element), this._element.style.display = "block", this._element.removeAttribute("aria-hidden"), this._element.scrollTop = 0, n && zt.reflow(this._element), De(this._element).addClass(Me), this._config.focus && this._enforceFocus();
			var o = De.Event(je.SHOWN, {
				relatedTarget: e
			});
			n ? De(this._dialog).one(zt.TRANSITION_END, i).emulateTransitionEnd(300) : i()
		}, Ae._enforceFocus = function() {
			var t = this;
			De(document).off(je.FOCUSIN).on(je.FOCUSIN, function(e) {
				document !== e.target && t._element !== e.target && 0 === De(t._element).has(e.target).length && t._element.focus()
			})
		}, Ae._setEscapeEvent = function() {
			var t = this;
			this._isShown && this._config.keyboard ? De(this._element).on(je.KEYDOWN_DISMISS, function(e) {
				27 === e.which && (e.preventDefault(), t.hide())
			}) : this._isShown || De(this._element).off(je.KEYDOWN_DISMISS)
		}, Ae._setResizeEvent = function() {
			var t = this;
			this._isShown ? De(window).on(je.RESIZE, function(e) {
				return t.handleUpdate(e)
			}) : De(window).off(je.RESIZE)
		}, Ae._hideModal = function() {
			var e = this;
			this._element.style.display = "none", this._element.setAttribute("aria-hidden", !0), this._isTransitioning = !1, this._showBackdrop(function() {
				De(document.body).removeClass(Pe), e._resetAdjustments(), e._resetScrollbar(), De(e._element).trigger(je.HIDDEN)
			})
		}, Ae._removeBackdrop = function() {
			this._backdrop && (De(this._backdrop).remove(), this._backdrop = null)
		}, Ae._showBackdrop = function(e) {
			var t = this,
				n = De(this._element).hasClass(Le) ? Le : "";
			if (this._isShown && this._config.backdrop) {
				var i = zt.supportsTransitionEnd() && n;
				if (this._backdrop = document.createElement("div"), this._backdrop.className = "modal-backdrop", n && De(this._backdrop).addClass(n), De(this._backdrop).appendTo(document.body), De(this._element).on(je.CLICK_DISMISS, function(e) {
						t._ignoreBackdropClick ? t._ignoreBackdropClick = !1 : e.target === e.currentTarget && ("static" === t._config.backdrop ? t._element.focus() : t.hide())
					}), i && zt.reflow(this._backdrop), De(this._backdrop).addClass(Me), !e) return;
				if (!i) return void e();
				De(this._backdrop).one(zt.TRANSITION_END, e).emulateTransitionEnd(150)
			} else if (!this._isShown && this._backdrop) {
				De(this._backdrop).removeClass(Me);
				var o = function() {
					t._removeBackdrop(), e && e()
				};
				zt.supportsTransitionEnd() && De(this._element).hasClass(Le) ? De(this._backdrop).one(zt.TRANSITION_END, o).emulateTransitionEnd(150) : o()
			} else e && e()
		}, Ae._adjustDialog = function() {
			var e = this._element.scrollHeight > document.documentElement.clientHeight;
			!this._isBodyOverflowing && e && (this._element.style.paddingLeft = this._scrollbarWidth + "px"), this._isBodyOverflowing && !e && (this._element.style.paddingRight = this._scrollbarWidth + "px")
		}, Ae._resetAdjustments = function() {
			this._element.style.paddingLeft = "", this._element.style.paddingRight = ""
		}, Ae._checkScrollbar = function() {
			var e = document.body.getBoundingClientRect();
			this._isBodyOverflowing = e.left + e.right < window.innerWidth, this._scrollbarWidth = this._getScrollbarWidth()
		}, Ae._setScrollbar = function() {
			var o = this;
			if (this._isBodyOverflowing) {
				De(Fe).each(function(e, t) {
					var n = De(t)[0].style.paddingRight,
						i = De(t).css("padding-right");
					De(t).data("padding-right", n).css("padding-right", parseFloat(i) + o._scrollbarWidth + "px")
				}), De(We).each(function(e, t) {
					var n = De(t)[0].style.marginRight,
						i = De(t).css("margin-right");
					De(t).data("margin-right", n).css("margin-right", parseFloat(i) - o._scrollbarWidth + "px")
				}), De(Be).each(function(e, t) {
					var n = De(t)[0].style.marginRight,
						i = De(t).css("margin-right");
					De(t).data("margin-right", n).css("margin-right", parseFloat(i) + o._scrollbarWidth + "px")
				});
				var e = document.body.style.paddingRight,
					t = De("body").css("padding-right");
				De("body").data("padding-right", e).css("padding-right", parseFloat(t) + this._scrollbarWidth + "px")
			}
		}, Ae._resetScrollbar = function() {
			De(Fe).each(function(e, t) {
				var n = De(t).data("padding-right");
				void 0 !== n && De(t).css("padding-right", n).removeData("padding-right")
			}), De(We + ", " + Be).each(function(e, t) {
				var n = De(t).data("margin-right");
				void 0 !== n && De(t).css("margin-right", n).removeData("margin-right")
			});
			var e = De("body").data("padding-right");
			void 0 !== e && De("body").css("padding-right", e).removeData("padding-right")
		}, Ae._getScrollbarWidth = function() {
			var e = document.createElement("div");
			e.className = "modal-scrollbar-measure", document.body.appendChild(e);
			var t = e.getBoundingClientRect().width - e.clientWidth;
			return document.body.removeChild(e), t
		}, un._jQueryInterface = function(n, i) {
			return this.each(function() {
				var e = De(this).data(ke),
					t = a({}, un.Default, De(this).data(), "object" == typeof n && n);
				if (e || (e = new un(this, t), De(this).data(ke, e)), "string" == typeof n) {
					if (void 0 === e[n]) throw new TypeError('No method named "' + n + '"');
					e[n](i)
				} else t.show && e.show(i)
			})
		}, r(un, null, [{
			key: "VERSION",
			get: function() {
				return "4.0.0"
			}
		}, {
			key: "Default",
			get: function() {
				return Oe
			}
		}]), Ue = un, De(document).on(je.CLICK_DATA_API, Re, function(e) {
			var t, n = this,
				i = zt.getSelectorFromElement(this);
			i && (t = De(i)[0]);
			var o = De(t).data(ke) ? "toggle" : a({}, De(t).data(), De(this).data());
			"A" !== this.tagName && "AREA" !== this.tagName || e.preventDefault();
			var r = De(t).one(je.SHOW, function(e) {
				e.isDefaultPrevented() || r.one(je.HIDDEN, function() {
					De(n).is(":visible") && n.focus()
				})
			});
			Ue._jQueryInterface.call(De(t), o, this)
		}), De.fn.modal = Ue._jQueryInterface, De.fn.modal.Constructor = Ue, De.fn.modal.noConflict = function() {
			return De.fn.modal = Ie, Ue._jQueryInterface
		}, Ue),
		nn = (fe = "tooltip", pe = "." + (he = "bs.tooltip"), me = (ue = t).fn[fe], ge = new RegExp("(^|\\s)bs-tooltip\\S+", "g"), be = {
			animation: !0,
			template: '<div class="tooltip" role="tooltip"><div class="arrow"></div><div class="tooltip-inner"></div></div>',
			trigger: "hover focus",
			title: "",
			delay: 0,
			html: !(ye = {
				AUTO: "auto",
				TOP: "top",
				RIGHT: "right",
				BOTTOM: "bottom",
				LEFT: "left"
			}),
			selector: !(ve = {
				animation: "boolean",
				template: "string",
				title: "(string|element|function)",
				trigger: "string",
				delay: "(number|object)",
				html: "boolean",
				selector: "(string|boolean)",
				placement: "(string|function)",
				offset: "(number|string)",
				container: "(string|element|boolean)",
				fallbackPlacement: "(string|array)",
				boundary: "(string|element)"
			}),
			placement: "top",
			offset: 0,
			container: !1,
			fallbackPlacement: "flip",
			boundary: "scrollParent"
		}, _e = {
			HIDE: "hide" + pe,
			HIDDEN: "hidden" + pe,
			SHOW: (we = "show") + pe,
			SHOWN: "shown" + pe,
			INSERTED: "inserted" + pe,
			CLICK: "click" + pe,
			FOCUSIN: "focusin" + pe,
			FOCUSOUT: "focusout" + pe,
			MOUSEENTER: "mouseenter" + pe,
			MOUSELEAVE: "mouseleave" + pe
		}, xe = "fade", Ee = "show", Ce = "hover", Te = "focus", (de = cn.prototype).enable = function() {
			this._isEnabled = !0
		}, de.disable = function() {
			this._isEnabled = !1
		}, de.toggleEnabled = function() {
			this._isEnabled = !this._isEnabled
		}, de.toggle = function(e) {
			if (this._isEnabled)
				if (e) {
					var t = this.constructor.DATA_KEY,
						n = ue(e.currentTarget).data(t);
					n || (n = new this.constructor(e.currentTarget, this._getDelegateConfig()), ue(e.currentTarget).data(t, n)), n._activeTrigger.click = !n._activeTrigger.click, n._isWithActiveTrigger() ? n._enter(null, n) : n._leave(null, n)
				} else {
					if (ue(this.getTipElement()).hasClass(Ee)) return void this._leave(null, this);
					this._enter(null, this)
				}
		}, de.dispose = function() {
			clearTimeout(this._timeout), ue.removeData(this.element, this.constructor.DATA_KEY), ue(this.element).off(this.constructor.EVENT_KEY), ue(this.element).closest(".modal").off("hide.bs.modal"), this.tip && ue(this.tip).remove(), this._isEnabled = null, this._timeout = null, this._hoverState = null, (this._activeTrigger = null) !== this._popper && this._popper.destroy(), this._popper = null, this.element = null, this.config = null, this.tip = null
		}, de.show = function() {
			var t = this;
			if ("none" === ue(this.element).css("display")) throw new Error("Please use show on visible elements");
			var e = ue.Event(this.constructor.Event.SHOW);
			if (this.isWithContent() && this._isEnabled) {
				ue(this.element).trigger(e);
				var n = ue.contains(this.element.ownerDocument.documentElement, this.element);
				if (e.isDefaultPrevented() || !n) return;
				var i = this.getTipElement(),
					o = zt.getUID(this.constructor.NAME);
				i.setAttribute("id", o), this.element.setAttribute("aria-describedby", o), this.setContent(), this.config.animation && ue(i).addClass(xe);
				var r = "function" == typeof this.config.placement ? this.config.placement.call(this, i, this.element) : this.config.placement,
					a = this._getAttachment(r);
				this.addAttachmentClass(a);
				var s = !1 === this.config.container ? document.body : ue(this.config.container);
				ue(i).data(this.constructor.DATA_KEY, this), ue.contains(this.element.ownerDocument.documentElement, this.tip) || ue(i).appendTo(s), ue(this.element).trigger(this.constructor.Event.INSERTED), this._popper = new c(this.element, i, {
					placement: a,
					modifiers: {
						offset: {
							offset: this.config.offset
						},
						flip: {
							behavior: this.config.fallbackPlacement
						},
						arrow: {
							element: ".arrow"
						},
						preventOverflow: {
							boundariesElement: this.config.boundary
						}
					},
					onCreate: function(e) {
						e.originalPlacement !== e.placement && t._handlePopperPlacementChange(e)
					},
					onUpdate: function(e) {
						t._handlePopperPlacementChange(e)
					}
				}), ue(i).addClass(Ee), "ontouchstart" in document.documentElement && ue("body").children().on("mouseover", null, ue.noop);
				var l = function() {
					t.config.animation && t._fixTransition();
					var e = t._hoverState;
					t._hoverState = null, ue(t.element).trigger(t.constructor.Event.SHOWN), "out" === e && t._leave(null, t)
				};
				zt.supportsTransitionEnd() && ue(this.tip).hasClass(xe) ? ue(this.tip).one(zt.TRANSITION_END, l).emulateTransitionEnd(cn._TRANSITION_DURATION) : l()
			}
		}, de.hide = function(e) {
			function t() {
				n._hoverState !== we && i.parentNode && i.parentNode.removeChild(i), n._cleanTipClass(), n.element.removeAttribute("aria-describedby"), ue(n.element).trigger(n.constructor.Event.HIDDEN), null !== n._popper && n._popper.destroy(), e && e()
			}
			var n = this,
				i = this.getTipElement(),
				o = ue.Event(this.constructor.Event.HIDE);
			ue(this.element).trigger(o), o.isDefaultPrevented() || (ue(i).removeClass(Ee), "ontouchstart" in document.documentElement && ue("body").children().off("mouseover", null, ue.noop), this._activeTrigger.click = !1, this._activeTrigger[Te] = !1, this._activeTrigger[Ce] = !1, zt.supportsTransitionEnd() && ue(this.tip).hasClass(xe) ? ue(i).one(zt.TRANSITION_END, t).emulateTransitionEnd(150) : t(), this._hoverState = "")
		}, de.update = function() {
			null !== this._popper && this._popper.scheduleUpdate()
		}, de.isWithContent = function() {
			return Boolean(this.getTitle())
		}, de.addAttachmentClass = function(e) {
			ue(this.getTipElement()).addClass("bs-tooltip-" + e)
		}, de.getTipElement = function() {
			return this.tip = this.tip || ue(this.config.template)[0], this.tip
		}, de.setContent = function() {
			var e = ue(this.getTipElement());
			this.setElementContent(e.find(".tooltip-inner"), this.getTitle()), e.removeClass(xe + " " + Ee)
		}, de.setElementContent = function(e, t) {
			var n = this.config.html;
			"object" == typeof t && (t.nodeType || t.jquery) ? n ? ue(t).parent().is(e) || e.empty().append(t) : e.text(ue(t).text()) : e[n ? "html" : "text"](t)
		}, de.getTitle = function() {
			var e = this.element.getAttribute("data-original-title");
			return e = e || ("function" == typeof this.config.title ? this.config.title.call(this.element) : this.config.title)
		}, de._getAttachment = function(e) {
			return ye[e.toUpperCase()]
		}, de._setListeners = function() {
			var i = this;
			this.config.trigger.split(" ").forEach(function(e) {
				if ("click" === e) ue(i.element).on(i.constructor.Event.CLICK, i.config.selector, function(e) {
					return i.toggle(e)
				});
				else if ("manual" !== e) {
					var t = e === Ce ? i.constructor.Event.MOUSEENTER : i.constructor.Event.FOCUSIN,
						n = e === Ce ? i.constructor.Event.MOUSELEAVE : i.constructor.Event.FOCUSOUT;
					ue(i.element).on(t, i.config.selector, function(e) {
						return i._enter(e)
					}).on(n, i.config.selector, function(e) {
						return i._leave(e)
					})
				}
				ue(i.element).closest(".modal").on("hide.bs.modal", function() {
					return i.hide()
				})
			}), this.config.selector ? this.config = a({}, this.config, {
				trigger: "manual",
				selector: ""
			}) : this._fixTitle()
		}, de._fixTitle = function() {
			var e = typeof this.element.getAttribute("data-original-title");
			!this.element.getAttribute("title") && "string" == e || (this.element.setAttribute("data-original-title", this.element.getAttribute("title") || ""), this.element.setAttribute("title", ""))
		}, de._enter = function(e, t) {
			var n = this.constructor.DATA_KEY;
			(t = t || ue(e.currentTarget).data(n)) || (t = new this.constructor(e.currentTarget, this._getDelegateConfig()), ue(e.currentTarget).data(n, t)), e && (t._activeTrigger["focusin" === e.type ? Te : Ce] = !0), ue(t.getTipElement()).hasClass(Ee) || t._hoverState === we ? t._hoverState = we : (clearTimeout(t._timeout), t._hoverState = we, t.config.delay && t.config.delay.show ? t._timeout = setTimeout(function() {
				t._hoverState === we && t.show()
			}, t.config.delay.show) : t.show())
		}, de._leave = function(e, t) {
			var n = this.constructor.DATA_KEY;
			(t = t || ue(e.currentTarget).data(n)) || (t = new this.constructor(e.currentTarget, this._getDelegateConfig()), ue(e.currentTarget).data(n, t)), e && (t._activeTrigger["focusout" === e.type ? Te : Ce] = !1), t._isWithActiveTrigger() || (clearTimeout(t._timeout), t._hoverState = "out", t.config.delay && t.config.delay.hide ? t._timeout = setTimeout(function() {
				"out" === t._hoverState && t.hide()
			}, t.config.delay.hide) : t.hide())
		}, de._isWithActiveTrigger = function() {
			for (var e in this._activeTrigger)
				if (this._activeTrigger[e]) return !0;
			return !1
		}, de._getConfig = function(e) {
			return "number" == typeof(e = a({}, this.constructor.Default, ue(this.element).data(), e)).delay && (e.delay = {
				show: e.delay,
				hide: e.delay
			}), "number" == typeof e.title && (e.title = e.title.toString()), "number" == typeof e.content && (e.content = e.content.toString()), zt.typeCheckConfig(fe, e, this.constructor.DefaultType), e
		}, de._getDelegateConfig = function() {
			var e = {};
			if (this.config)
				for (var t in this.config) this.constructor.Default[t] !== this.config[t] && (e[t] = this.config[t]);
			return e
		}, de._cleanTipClass = function() {
			var e = ue(this.getTipElement()),
				t = e.attr("class").match(ge);
			null !== t && 0 < t.length && e.removeClass(t.join(""))
		}, de._handlePopperPlacementChange = function(e) {
			this._cleanTipClass(), this.addAttachmentClass(this._getAttachment(e.placement))
		}, de._fixTransition = function() {
			var e = this.getTipElement(),
				t = this.config.animation;
			null === e.getAttribute("x-placement") && (ue(e).removeClass(xe), this.config.animation = !1, this.hide(), this.show(), this.config.animation = t)
		}, cn._jQueryInterface = function(n) {
			return this.each(function() {
				var e = ue(this).data(he),
					t = "object" == typeof n && n;
				if ((e || !/dispose|hide/.test(n)) && (e || (e = new cn(this, t), ue(this).data(he, e)), "string" == typeof n)) {
					if (void 0 === e[n]) throw new TypeError('No method named "' + n + '"');
					e[n]()
				}
			})
		}, r(cn, null, [{
			key: "VERSION",
			get: function() {
				return "4.0.0"
			}
		}, {
			key: "Default",
			get: function() {
				return be
			}
		}, {
			key: "NAME",
			get: function() {
				return fe
			}
		}, {
			key: "DATA_KEY",
			get: function() {
				return he
			}
		}, {
			key: "Event",
			get: function() {
				return _e
			}
		}, {
			key: "EVENT_KEY",
			get: function() {
				return pe
			}
		}, {
			key: "DefaultType",
			get: function() {
				return ve
			}
		}]), Se = cn, ue.fn[fe] = Se._jQueryInterface, ue.fn[fe].Constructor = Se, ue.fn[fe].noConflict = function() {
			return ue.fn[fe] = me, Se._jQueryInterface
		}, Se),
		on = (te = "popover", ie = "." + (ne = "bs.popover"), oe = (ee = t).fn[te], re = new RegExp("(^|\\s)bs-popover\\S+", "g"), ae = a({}, nn.Default, {
			placement: "right",
			trigger: "click",
			content: "",
			template: '<div class="popover" role="tooltip"><div class="arrow"></div><h3 class="popover-header"></h3><div class="popover-body"></div></div>'
		}), se = a({}, nn.DefaultType, {
			content: "(string|element|function)"
		}), le = {
			HIDE: "hide" + ie,
			HIDDEN: "hidden" + ie,
			SHOW: "show" + ie,
			SHOWN: "shown" + ie,
			INSERTED: "inserted" + ie,
			CLICK: "click" + ie,
			FOCUSIN: "focusin" + ie,
			FOCUSOUT: "focusout" + ie,
			MOUSEENTER: "mouseenter" + ie,
			MOUSELEAVE: "mouseleave" + ie
		}, ce = function(e) {
			var t, n;

			function i() {
				return e.apply(this, arguments) || this
			}
			n = e, (t = i).prototype = Object.create(n.prototype), (t.prototype.constructor = t).__proto__ = n;
			var o = i.prototype;
			return o.isWithContent = function() {
				return this.getTitle() || this._getContent()
			}, o.addAttachmentClass = function(e) {
				ee(this.getTipElement()).addClass("bs-popover-" + e)
			}, o.getTipElement = function() {
				return this.tip = this.tip || ee(this.config.template)[0], this.tip
			}, o.setContent = function() {
				var e = ee(this.getTipElement());
				this.setElementContent(e.find(".popover-header"), this.getTitle());
				var t = this._getContent();
				"function" == typeof t && (t = t.call(this.element)), this.setElementContent(e.find(".popover-body"), t), e.removeClass("fade show")
			}, o._getContent = function() {
				return this.element.getAttribute("data-content") || this.config.content
			}, o._cleanTipClass = function() {
				var e = ee(this.getTipElement()),
					t = e.attr("class").match(re);
				null !== t && 0 < t.length && e.removeClass(t.join(""))
			}, i._jQueryInterface = function(n) {
				return this.each(function() {
					var e = ee(this).data(ne),
						t = "object" == typeof n ? n : null;
					if ((e || !/destroy|hide/.test(n)) && (e || (e = new i(this, t), ee(this).data(ne, e)), "string" == typeof n)) {
						if (void 0 === e[n]) throw new TypeError('No method named "' + n + '"');
						e[n]()
					}
				})
			}, r(i, null, [{
				key: "VERSION",
				get: function() {
					return "4.0.0"
				}
			}, {
				key: "Default",
				get: function() {
					return ae
				}
			}, {
				key: "NAME",
				get: function() {
					return te
				}
			}, {
				key: "DATA_KEY",
				get: function() {
					return ne
				}
			}, {
				key: "Event",
				get: function() {
					return le
				}
			}, {
				key: "EVENT_KEY",
				get: function() {
					return ie
				}
			}, {
				key: "DefaultType",
				get: function() {
					return se
				}
			}]), i
		}(nn), ee.fn[te] = ce._jQueryInterface, ee.fn[te].Constructor = ce, ee.fn[te].noConflict = function() {
			return ee.fn[te] = oe, ce._jQueryInterface
		}, ce),
		rn = (P = "scrollspy", M = "." + (L = "bs.scrollspy"), H = ($ = t).fn[P], R = {
			offset: 10,
			method: "auto",
			target: ""
		}, q = {
			offset: "number",
			method: "string",
			target: "(string|element)"
		}, F = {
			ACTIVATE: "activate" + M,
			SCROLL: "scroll" + M,
			LOAD_DATA_API: "load" + M + ".data-api"
		}, W = "active", B = '[data-spy="scroll"]', U = ".active", K = ".nav, .list-group", V = ".nav-link", X = ".nav-item", Y = ".list-group-item", z = ".dropdown", Q = ".dropdown-item", G = ".dropdown-toggle", J = "position", (j = ln.prototype).refresh = function() {
			var t = this,
				e = this._scrollElement === this._scrollElement.window ? "offset" : J,
				o = "auto" === this._config.method ? e : this._config.method,
				r = o === J ? this._getScrollTop() : 0;
			this._offsets = [], this._targets = [], this._scrollHeight = this._getScrollHeight(), $.makeArray($(this._selector)).map(function(e) {
				var t, n = zt.getSelectorFromElement(e);
				if (n && (t = $(n)[0]), t) {
					var i = t.getBoundingClientRect();
					if (i.width || i.height) return [$(t)[o]().top + r, n]
				}
				return null
			}).filter(function(e) {
				return e
			}).sort(function(e, t) {
				return e[0] - t[0]
			}).forEach(function(e) {
				t._offsets.push(e[0]), t._targets.push(e[1])
			})
		}, j.dispose = function() {
			$.removeData(this._element, L), $(this._scrollElement).off(M), this._element = null, this._scrollElement = null, this._config = null, this._selector = null, this._offsets = null, this._targets = null, this._activeTarget = null, this._scrollHeight = null
		}, j._getConfig = function(e) {
			if ("string" != typeof(e = a({}, R, e)).target) {
				var t = $(e.target).attr("id");
				t || (t = zt.getUID(P), $(e.target).attr("id", t)), e.target = "#" + t
			}
			return zt.typeCheckConfig(P, e, q), e
		}, j._getScrollTop = function() {
			return this._scrollElement === window ? this._scrollElement.pageYOffset : this._scrollElement.scrollTop
		}, j._getScrollHeight = function() {
			return this._scrollElement.scrollHeight || Math.max(document.body.scrollHeight, document.documentElement.scrollHeight)
		}, j._getOffsetHeight = function() {
			return this._scrollElement === window ? window.innerHeight : this._scrollElement.getBoundingClientRect().height
		}, j._process = function() {
			var e = this._getScrollTop() + this._config.offset,
				t = this._getScrollHeight(),
				n = this._config.offset + t - this._getOffsetHeight();
			if (this._scrollHeight !== t && this.refresh(), n <= e) {
				var i = this._targets[this._targets.length - 1];
				this._activeTarget !== i && this._activate(i)
			} else {
				if (this._activeTarget && e < this._offsets[0] && 0 < this._offsets[0]) return this._activeTarget = null, void this._clear();
				for (var o = this._offsets.length; o--;) this._activeTarget !== this._targets[o] && e >= this._offsets[o] && (void 0 === this._offsets[o + 1] || e < this._offsets[o + 1]) && this._activate(this._targets[o])
			}
		}, j._activate = function(t) {
			this._activeTarget = t, this._clear();
			var e = this._selector.split(",");
			e = e.map(function(e) {
				return e + '[data-target="' + t + '"],' + e + '[href="' + t + '"]'
			});
			var n = $(e.join(","));
			n.hasClass("dropdown-item") ? (n.closest(z).find(G).addClass(W), n.addClass(W)) : (n.addClass(W), n.parents(K).prev(V + ", " + Y).addClass(W), n.parents(K).prev(X).children(V).addClass(W)), $(this._scrollElement).trigger(F.ACTIVATE, {
				relatedTarget: t
			})
		}, j._clear = function() {
			$(this._selector).filter(U).removeClass(W)
		}, ln._jQueryInterface = function(t) {
			return this.each(function() {
				var e = $(this).data(L);
				if (e || (e = new ln(this, "object" == typeof t && t), $(this).data(L, e)), "string" == typeof t) {
					if (void 0 === e[t]) throw new TypeError('No method named "' + t + '"');
					e[t]()
				}
			})
		}, r(ln, null, [{
			key: "VERSION",
			get: function() {
				return "4.0.0"
			}
		}, {
			key: "Default",
			get: function() {
				return R
			}
		}]), Z = ln, $(window).on(F.LOAD_DATA_API, function() {
			for (var e = $.makeArray($(B)), t = e.length; t--;) {
				var n = $(e[t]);
				Z._jQueryInterface.call(n, n.data())
			}
		}), $.fn[P] = Z._jQueryInterface, $.fn[P].Constructor = Z, $.fn[P].noConflict = function() {
			return $.fn[P] = H, Z._jQueryInterface
		}, Z),
		an = (S = "." + (T = "bs.tab"), D = (E = t).fn.tab, A = {
			HIDE: "hide" + S,
			HIDDEN: "hidden" + S,
			SHOW: "show" + S,
			SHOWN: "shown" + S,
			CLICK_DATA_API: "click.bs.tab.data-api"
		}, k = "active", N = ".active", I = "> li > .active", (C = sn.prototype).show = function() {
			var n = this;
			if (!(this._element.parentNode && this._element.parentNode.nodeType === Node.ELEMENT_NODE && E(this._element).hasClass(k) || E(this._element).hasClass("disabled"))) {
				var e, i, t = E(this._element).closest(".nav, .list-group")[0],
					o = zt.getSelectorFromElement(this._element);
				if (t) {
					var r = "UL" === t.nodeName ? I : N;
					i = (i = E.makeArray(E(t).find(r)))[i.length - 1]
				}
				var a = E.Event(A.HIDE, {
						relatedTarget: this._element
					}),
					s = E.Event(A.SHOW, {
						relatedTarget: i
					});
				if (i && E(i).trigger(a), E(this._element).trigger(s), !s.isDefaultPrevented() && !a.isDefaultPrevented()) {
					o && (e = E(o)[0]), this._activate(this._element, t);
					var l = function() {
						var e = E.Event(A.HIDDEN, {
								relatedTarget: n._element
							}),
							t = E.Event(A.SHOWN, {
								relatedTarget: i
							});
						E(i).trigger(e), E(n._element).trigger(t)
					};
					e ? this._activate(e, e.parentNode, l) : l()
				}
			}
		}, C.dispose = function() {
			E.removeData(this._element, T), this._element = null
		}, C._activate = function(e, t, n) {
			function i() {
				return o._transitionComplete(e, r, n)
			}
			var o = this,
				r = ("UL" === t.nodeName ? E(t).find(I) : E(t).children(N))[0],
				a = n && zt.supportsTransitionEnd() && r && E(r).hasClass("fade");
			r && a ? E(r).one(zt.TRANSITION_END, i).emulateTransitionEnd(150) : i()
		}, C._transitionComplete = function(e, t, n) {
			if (t) {
				E(t).removeClass("show " + k);
				var i = E(t.parentNode).find("> .dropdown-menu .active")[0];
				i && E(i).removeClass(k), "tab" === t.getAttribute("role") && t.setAttribute("aria-selected", !1)
			}
			if (E(e).addClass(k), "tab" === e.getAttribute("role") && e.setAttribute("aria-selected", !0), zt.reflow(e), E(e).addClass("show"), e.parentNode && E(e.parentNode).hasClass("dropdown-menu")) {
				var o = E(e).closest(".dropdown")[0];
				o && E(o).find(".dropdown-toggle").addClass(k), e.setAttribute("aria-expanded", !0)
			}
			n && n()
		}, sn._jQueryInterface = function(n) {
			return this.each(function() {
				var e = E(this),
					t = e.data(T);
				if (t || (t = new sn(this), e.data(T, t)), "string" == typeof n) {
					if (void 0 === t[n]) throw new TypeError('No method named "' + n + '"');
					t[n]()
				}
			})
		}, r(sn, null, [{
			key: "VERSION",
			get: function() {
				return "4.0.0"
			}
		}]), O = sn, E(document).on(A.CLICK_DATA_API, '[data-toggle="tab"], [data-toggle="pill"], [data-toggle="list"]', function(e) {
			e.preventDefault(), O._jQueryInterface.call(E(this), "show")
		}), E.fn.tab = O._jQueryInterface, E.fn.tab.Constructor = O, E.fn.tab.noConflict = function() {
			return E.fn.tab = D, O._jQueryInterface
		}, O);

	function sn(e) {
		this._element = e
	}

	function ln(e, t) {
		var n = this;
		this._element = e, this._scrollElement = "BODY" === e.tagName ? window : e, this._config = this._getConfig(t), this._selector = this._config.target + " " + V + "," + this._config.target + " " + Y + "," + this._config.target + " " + Q, this._offsets = [], this._targets = [], this._activeTarget = null, this._scrollHeight = 0, $(this._scrollElement).on(F.SCROLL, function(e) {
			return n._process(e)
		}), this.refresh(), this._process()
	}

	function cn(e, t) {
		if (void 0 === c) throw new TypeError("Bootstrap tooltips require Popper.js (https://popper.js.org)");
		this._isEnabled = !0, this._timeout = 0, this._hoverState = "", this._activeTrigger = {}, this._popper = null, this.element = e, this.config = this._getConfig(t), this.tip = null, this._setListeners()
	}

	function un(e, t) {
		this._config = this._getConfig(t), this._element = e, this._dialog = De(e).find(He)[0], this._backdrop = null, this._isShown = !1, this._isBodyOverflowing = !1, this._ignoreBackdropClick = !1, this._originalBodyPadding = 0, this._scrollbarWidth = 0
	}

	function dn(e, t) {
		this._element = e, this._popper = null, this._config = this._getConfig(t), this._menu = this._getMenuElement(), this._inNavbar = this._detectNavbar(), this._addEventListeners()
	}

	function fn(e, t) {
		this._isTransitioning = !1, this._element = e, this._config = this._getConfig(t), this._triggerArray = lt.makeArray(lt('[data-toggle="collapse"][href="#' + e.id + '"],[data-toggle="collapse"][data-target="#' + e.id + '"]'));
		for (var n = lt(xt), i = 0; i < n.length; i++) {
			var o = n[i],
				r = zt.getSelectorFromElement(o);
			null !== r && 0 < lt(r).filter(e).length && (this._selector = r, this._triggerArray.push(o))
		}
		this._parent = this._config.parent ? this._getParent() : null, this._config.parent || this._addAriaAndCollapsedClass(this._element, this._triggerArray), this._config.toggle && this.toggle()
	}

	function hn(e, t) {
		this._items = null, this._interval = null, this._activeElement = null, this._isPaused = !1, this._isSliding = !1, this.touchTimeout = null, this._config = this._getConfig(t), this._element = Ct(e)[0], this._indicatorsElement = Ct(this._element).find(qt)[0], this._addEventListeners()
	}

	function pn(e) {
		this._element = e
	}

	function mn(e) {
		this._element = e
	}! function(e) {
		if (void 0 === e) throw new TypeError("Bootstrap's JavaScript requires jQuery. jQuery must be included before Bootstrap's JavaScript.");
		var t = e.fn.jquery.split(" ")[0].split(".");
		if (t[0] < 2 && t[1] < 9 || 1 === t[0] && 9 === t[1] && t[2] < 1 || 4 <= t[0]) throw new Error("Bootstrap's JavaScript requires at least jQuery v1.9.1 but less than v4.0.0")
	}(t), e.Util = zt, e.Alert = Qt, e.Button = Gt, e.Carousel = Jt, e.Collapse = Zt, e.Dropdown = en, e.Modal = tn, e.Popover = on, e.Scrollspy = rn, e.Tab = an, e.Tooltip = nn, Object.defineProperty(e, "__esModule", {
		value: !0
	})
}),
function() {
	function t(e, t) {
		return function() {
			return e.apply(t, arguments)
		}
	}
	var i, e, n, l, o, a = [].indexOf || function(e) {
		for (var t = 0, n = this.length; t < n; t++)
			if (t in this && this[t] === e) return t;
		return -1
	};

	function r(e) {
		null == e && (e = {}), this.scrollCallback = t(this.scrollCallback, this), this.scrollHandler = t(this.scrollHandler, this), this.resetAnimation = t(this.resetAnimation, this), this.start = t(this.start, this), this.scrolled = !0, this.config = this.util().extend(e, this.defaults), this.animationNameCache = new n, this.wowEvent = this.util().createEvent(this.config.boxClass)
	}

	function s() {
		"undefined" != typeof console && null !== console && console.warn("MutationObserver is not supported by your browser."), "undefined" != typeof console && null !== console && console.warn("WOW.js cannot detect dom mutations, please call .sync() after loading new content.")
	}

	function c() {
		this.keys = [], this.values = []
	}

	function u() {}
	u.prototype.extend = function(e, t) {
		var n, i;
		for (n in t) i = t[n], null == e[n] && (e[n] = i);
		return e
	}, u.prototype.isMobile = function(e) {
		return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(e)
	}, u.prototype.createEvent = function(e, t, n, i) {
		var o;
		return null == t && (t = !1), null == n && (n = !1), null == i && (i = null), null != document.createEvent ? (o = document.createEvent("CustomEvent")).initCustomEvent(e, t, n, i) : null != document.createEventObject ? (o = document.createEventObject()).eventType = e : o.eventName = e, o
	}, u.prototype.emitEvent = function(e, t) {
		return null != e.dispatchEvent ? e.dispatchEvent(t) : t in (null != e) ? e[t]() : "on" + t in (null != e) ? e["on" + t]() : void 0
	}, u.prototype.addEvent = function(e, t, n) {
		return null != e.addEventListener ? e.addEventListener(t, n, !1) : null != e.attachEvent ? e.attachEvent("on" + t, n) : e[t] = n
	}, u.prototype.removeEvent = function(e, t, n) {
		return null != e.removeEventListener ? e.removeEventListener(t, n, !1) : null != e.detachEvent ? e.detachEvent("on" + t, n) : delete e[t]
	}, u.prototype.innerHeight = function() {
		return "innerHeight" in window ? window.innerHeight : document.documentElement.clientHeight
	}, e = u, n = this.WeakMap || this.MozWeakMap || (c.prototype.get = function(e) {
		var t, n, i, o;
		for (t = n = 0, i = (o = this.keys).length; n < i; t = ++n)
			if (o[t] === e) return this.values[t]
	}, c.prototype.set = function(e, t) {
		var n, i, o, r;
		for (n = i = 0, o = (r = this.keys).length; i < o; n = ++i)
			if (r[n] === e) return void(this.values[n] = t);
		return this.keys.push(e), this.values.push(t)
	}, c), i = this.MutationObserver || this.WebkitMutationObserver || this.MozMutationObserver || (s.notSupported = !0, s.prototype.observe = function() {}, s), l = this.getComputedStyle || function(n) {
		return this.getPropertyValue = function(e) {
			var t;
			return "float" === e && (e = "styleFloat"), o.test(e) && e.replace(o, function(e, t) {
				return t.toUpperCase()
			}), (null != (t = n.currentStyle) ? t[e] : void 0) || null
		}, this
	}, o = /(\-([a-z]){1})/g, this.WOW = (r.prototype.defaults = {
		boxClass: "wow",
		animateClass: "animated",
		offset: 0,
		mobile: !0,
		live: !0,
		callback: null
	}, r.prototype.init = function() {
		var e;
		return this.element = window.document.documentElement, "interactive" === (e = document.readyState) || "complete" === e ? this.start() : this.util().addEvent(document, "DOMContentLoaded", this.start), this.finished = []
	}, r.prototype.start = function() {
		var o, e, t, n, a;
		if (this.stopped = !1, this.boxes = function() {
				var e, t, n, i;
				for (i = [], e = 0, t = (n = this.element.querySelectorAll("." + this.config.boxClass)).length; e < t; e++) o = n[e], i.push(o);
				return i
			}.call(this), this.all = function() {
				var e, t, n, i;
				for (i = [], e = 0, t = (n = this.boxes).length; e < t; e++) o = n[e], i.push(o);
				return i
			}.call(this), this.boxes.length)
			if (this.disabled()) this.resetStyle();
			else
				for (e = 0, t = (n = this.boxes).length; e < t; e++) o = n[e], this.applyStyle(o, !0);
		return this.disabled() || (this.util().addEvent(window, "scroll", this.scrollHandler), this.util().addEvent(window, "resize", this.scrollHandler), this.interval = setInterval(this.scrollCallback, 50)), this.config.live ? new i((a = this, function(e) {
			var t, n, o, r, i;
			for (i = [], t = 0, n = e.length; t < n; t++) r = e[t], i.push(function() {
				var e, t, n, i;
				for (i = [], e = 0, t = (n = r.addedNodes || []).length; e < t; e++) o = n[e], i.push(this.doSync(o));
				return i
			}.call(a));
			return i
		})).observe(document.body, {
			childList: !0,
			subtree: !0
		}) : void 0
	}, r.prototype.stop = function() {
		return this.stopped = !0, this.util().removeEvent(window, "scroll", this.scrollHandler), this.util().removeEvent(window, "resize", this.scrollHandler), null != this.interval ? clearInterval(this.interval) : void 0
	}, r.prototype.sync = function() {
		return i.notSupported ? this.doSync(this.element) : void 0
	}, r.prototype.doSync = function(e) {
		var t, n, i, o, r;
		if (null == e && (e = this.element), 1 === e.nodeType) {
			for (r = [], n = 0, i = (o = (e = e.parentNode || e).querySelectorAll("." + this.config.boxClass)).length; n < i; n++) t = o[n], a.call(this.all, t) < 0 ? (this.boxes.push(t), this.all.push(t), this.stopped || this.disabled() ? this.resetStyle() : this.applyStyle(t, !0), r.push(this.scrolled = !0)) : r.push(void 0);
			return r
		}
	}, r.prototype.show = function(e) {
		return this.applyStyle(e), e.className = e.className + " " + this.config.animateClass, null != this.config.callback && this.config.callback(e), this.util().emitEvent(e, this.wowEvent), this.util().addEvent(e, "animationend", this.resetAnimation), this.util().addEvent(e, "oanimationend", this.resetAnimation), this.util().addEvent(e, "webkitAnimationEnd", this.resetAnimation), this.util().addEvent(e, "MSAnimationEnd", this.resetAnimation), e
	}, r.prototype.applyStyle = function(e, t) {
		var n, i, o, r;
		return i = e.getAttribute("data-wow-duration"), n = e.getAttribute("data-wow-delay"), o = e.getAttribute("data-wow-iteration"), this.animate((r = this, function() {
			return r.customStyle(e, t, i, n, o)
		}))
	}, r.prototype.animate = "requestAnimationFrame" in window ? function(e) {
		return window.requestAnimationFrame(e)
	} : function(e) {
		return e()
	}, r.prototype.resetStyle = function() {
		var e, t, n, i, o;
		for (o = [], t = 0, n = (i = this.boxes).length; t < n; t++) e = i[t], o.push(e.style.visibility = "visible");
		return o
	}, r.prototype.resetAnimation = function(e) {
		var t;
		return 0 <= e.type.toLowerCase().indexOf("animationend") ? (t = e.target || e.srcElement).className = t.className.replace(this.config.animateClass, "").trim() : void 0
	}, r.prototype.customStyle = function(e, t, n, i, o) {
		return t && this.cacheAnimationName(e), e.style.visibility = t ? "hidden" : "visible", n && this.vendorSet(e.style, {
			animationDuration: n
		}), i && this.vendorSet(e.style, {
			animationDelay: i
		}), o && this.vendorSet(e.style, {
			animationIterationCount: o
		}), this.vendorSet(e.style, {
			animationName: t ? "none" : this.cachedAnimationName(e)
		}), e
	}, r.prototype.vendors = ["moz", "webkit"], r.prototype.vendorSet = function(o, e) {
		var r, t, a, s;
		for (r in t = [], e) a = e[r], o["" + r] = a, t.push(function() {
			var e, t, n, i;
			for (i = [], e = 0, t = (n = this.vendors).length; e < t; e++) s = n[e], i.push(o["" + s + r.charAt(0).toUpperCase() + r.substr(1)] = a);
			return i
		}.call(this));
		return t
	}, r.prototype.vendorCSS = function(e, t) {
		var n, i, o, r, a, s;
		for (r = (a = l(e)).getPropertyCSSValue(t), n = 0, i = (o = this.vendors).length; n < i; n++) s = o[n], r = r || a.getPropertyCSSValue("-" + s + "-" + t);
		return r
	}, r.prototype.animationName = function(t) {
		var n;
		try {
			n = this.vendorCSS(t, "animation-name").cssText
		} catch (e) {
			n = l(t).getPropertyValue("animation-name")
		}
		return "none" === n ? "" : n
	}, r.prototype.cacheAnimationName = function(e) {
		return this.animationNameCache.set(e, this.animationName(e))
	}, r.prototype.cachedAnimationName = function(e) {
		return this.animationNameCache.get(e)
	}, r.prototype.scrollHandler = function() {
		return this.scrolled = !0
	}, r.prototype.scrollCallback = function() {
		var o;
		return !this.scrolled || (this.scrolled = !1, this.boxes = function() {
			var e, t, n, i;
			for (i = [], e = 0, t = (n = this.boxes).length; e < t; e++)(o = n[e]) && (this.isVisible(o) ? this.show(o) : i.push(o));
			return i
		}.call(this), this.boxes.length || this.config.live) ? void 0 : this.stop()
	}, r.prototype.offsetTop = function(e) {
		for (var t; void 0 === e.offsetTop;) e = e.parentNode;
		for (t = e.offsetTop; e = e.offsetParent;) t += e.offsetTop;
		return t
	}, r.prototype.isVisible = function(e) {
		var t, n, i, o, r;
		return n = e.getAttribute("data-wow-offset") || this.config.offset, o = (r = window.pageYOffset) + Math.min(this.element.clientHeight, this.util().innerHeight()) - n, t = (i = this.offsetTop(e)) + e.clientHeight, i <= o && r <= t
	}, r.prototype.util = function() {
		return null != this._util ? this._util : this._util = new e
	}, r.prototype.disabled = function() {
		return !this.config.mobile && this.util().isMobile(navigator.userAgent)
	}, r)
}.call(this),
	function(e, t) {
		"object" == typeof exports && "undefined" != typeof module ? module.exports = t() : "function" == typeof define && define.amd ? define(t) : (e = e || self).Sortable = t()
	}(this, function() {
		"use strict";

		function i(e) {
			return (i = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
				return typeof e
			} : function(e) {
				return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
			})(e)
		}

		function a() {
			return (a = Object.assign || function(e) {
				for (var t = 1; t < arguments.length; t++) {
					var n = arguments[t];
					for (var i in n) Object.prototype.hasOwnProperty.call(n, i) && (e[i] = n[i])
				}
				return e
			}).apply(this, arguments)
		}

		function U(o) {
			for (var e = 1; e < arguments.length; e++) {
				var r = null != arguments[e] ? arguments[e] : {},
					t = Object.keys(r);
				"function" == typeof Object.getOwnPropertySymbols && (t = t.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
					return Object.getOwnPropertyDescriptor(r, e).enumerable
				}))), t.forEach(function(e) {
					var t, n, i;
					t = o, i = r[n = e], n in t ? Object.defineProperty(t, n, {
						value: i,
						enumerable: !0,
						configurable: !0,
						writable: !0
					}) : t[n] = i
				})
			}
			return o
		}

		function e(e) {
			if ("undefined" != typeof window && window.navigator) return !!navigator.userAgent.match(e)
		}
		var w = e(/(?:Trident.*rv[ :]?11\.|msie|iemobile|Windows Phone)/i),
			_ = e(/Edge/i),
			c = e(/firefox/i),
			s = e(/safari/i) && !e(/chrome/i) && !e(/android/i),
			t = e(/iP(ad|od|hone)/i),
			n = e(/chrome/i) && e(/android/i),
			o = {
				capture: !1,
				passive: !1
			};

		function u(e, t, n) {
			e.addEventListener(t, n, !w && o)
		}

		function r(e, t, n) {
			e.removeEventListener(t, n, !w && o)
		}

		function l(e, t) {
			if (t) {
				if (">" === t[0] && (t = t.substring(1)), e) try {
					if (e.matches) return e.matches(t);
					if (e.msMatchesSelector) return e.msMatchesSelector(t);
					if (e.webkitMatchesSelector) return e.webkitMatchesSelector(t)
				} catch (e) {
					return !1
				}
				return !1
			}
		}

		function K(e, t, n, i) {
			if (e) {
				n = n || document;
				do {
					if (null != t && (">" === t[0] ? e.parentNode === n && l(e, t) : l(e, t)) || i && e === n) return e;
					if (e === n) break
				} while (e = e.host && e !== document && e.host.nodeType ? e.host : e.parentNode)
			}
			return null
		}
		var d, f = /\s+/g;

		function V(e, t, n) {
			if (e && t)
				if (e.classList) e.classList[n ? "add" : "remove"](t);
				else {
					var i = (" " + e.className + " ").replace(f, " ").replace(" " + t + " ", " ");
					e.className = (i + (n ? " " + t : "")).replace(f, " ")
				}
		}

		function X(e, t, n) {
			var i = e && e.style;
			if (i) {
				if (void 0 === n) return document.defaultView && document.defaultView.getComputedStyle ? n = document.defaultView.getComputedStyle(e, "") : e.currentStyle && (n = e.currentStyle), void 0 === t ? n : n[t];
				t in i || -1 !== t.indexOf("webkit") || (t = "-webkit-" + t), i[t] = n + ("string" == typeof n ? "" : "px")
			}
		}

		function g(e, t) {
			var n = "";
			if ("string" == typeof e) n = e;
			else
				do {
					var i = X(e, "transform");
					i && "none" !== i && (n = i + " " + n)
				} while (!t && (e = e.parentNode));
			var o = window.DOMMatrix || window.WebKitCSSMatrix || window.CSSMatrix || window.MSCSSMatrix;
			return o && new o(n)
		}

		function h(e, t, n) {
			if (e) {
				var i = e.getElementsByTagName(t),
					o = 0,
					r = i.length;
				if (n)
					for (; o < r; o++) n(i[o], o);
				return i
			}
			return []
		}

		function I() {
			return document.scrollingElement || document.documentElement
		}

		function Y(e, t, n, i, o) {
			if (e.getBoundingClientRect || e === window) {
				var r, a, s, l, c, u, d;
				if (d = e !== window && e !== I() ? (a = (r = e.getBoundingClientRect()).top, s = r.left, l = r.bottom, c = r.right, u = r.height, r.width) : (s = a = 0, l = window.innerHeight, c = window.innerWidth, u = window.innerHeight, window.innerWidth), (t || n) && e !== window && (o = o || e.parentNode, !w))
					do {
						if (o && o.getBoundingClientRect && ("none" !== X(o, "transform") || n && "static" !== X(o, "position"))) {
							var f = o.getBoundingClientRect();
							a -= f.top + parseInt(X(o, "border-top-width")), s -= f.left + parseInt(X(o, "border-left-width")), l = a + r.height, c = s + r.width;
							break
						}
					} while (o = o.parentNode);
				if (i && e !== window) {
					var h = g(o || e),
						p = h && h.a,
						m = h && h.d;
					h && (l = (a /= m) + (u /= m), c = (s /= p) + (d /= p))
				}
				return {
					top: a,
					left: s,
					bottom: l,
					right: c,
					width: d,
					height: u
				}
			}
		}

		function z(e, t, n) {
			for (var i = O(e, !0), o = Y(e)[t]; i;) {
				var r = Y(i)[n];
				if (!("top" === n || "left" === n ? r <= o : o <= r)) return i;
				if (i === I()) break;
				i = O(i, !1)
			}
			return !1
		}

		function p(e, t, n) {
			for (var i = 0, o = 0, r = e.children; o < r.length;) {
				if ("none" !== r[o].style.display && r[o] !== $e.ghost && r[o] !== $e.dragged && K(r[o], n.draggable, e, !1)) {
					if (i === t) return r[o];
					i++
				}
				o++
			}
			return null
		}

		function Q(e, t) {
			for (var n = e.lastElementChild; n && (n === $e.ghost || "none" === X(n, "display") || t && !l(n, t));) n = n.previousElementSibling;
			return n || null
		}

		function G(e, t) {
			var n = 0;
			if (!e || !e.parentNode) return -1;
			for (; e = e.previousElementSibling;) "TEMPLATE" === e.nodeName.toUpperCase() || e === $e.clone || t && !l(e, t) || n++;
			return n
		}

		function m(e) {
			var t = 0,
				n = 0,
				i = I();
			if (e)
				do {
					var o = g(e),
						r = o.a,
						a = o.d;
					t += e.scrollLeft * r, n += e.scrollTop * a
				} while (e !== i && (e = e.parentNode));
			return [t, n]
		}

		function O(e, t) {
			if (!e || !e.getBoundingClientRect) return I();
			var n = e,
				i = !1;
			do {
				if (n.clientWidth < n.scrollWidth || n.clientHeight < n.scrollHeight) {
					var o = X(n);
					if (n.clientWidth < n.scrollWidth && ("auto" == o.overflowX || "scroll" == o.overflowX) || n.clientHeight < n.scrollHeight && ("auto" == o.overflowY || "scroll" == o.overflowY)) {
						if (!n.getBoundingClientRect || n === document.body) return I();
						if (i || t) return n;
						i = !0
					}
				}
			} while (n = n.parentNode);
			return I()
		}

		function v(e, t) {
			return Math.round(e.top) === Math.round(t.top) && Math.round(e.left) === Math.round(t.left) && Math.round(e.height) === Math.round(t.height) && Math.round(e.width) === Math.round(t.width)
		}

		function y(t, n) {
			return function() {
				if (!d) {
					var e = arguments;
					1 === e.length ? t.call(this, e[0]) : t.apply(this, e), d = setTimeout(function() {
						d = void 0
					}, n)
				}
			}
		}

		function J(e, t, n) {
			e.scrollLeft += t, e.scrollTop += n
		}

		function b(e) {
			var t = window.Polymer,
				n = window.jQuery || window.Zepto;
			return t && t.dom ? t.dom(e).cloneNode(!0) : n ? n(e).clone(!0)[0] : e.cloneNode(!0)
		}

		function x(e, t) {
			X(e, "position", "absolute"), X(e, "top", t.top), X(e, "left", t.left), X(e, "width", t.width), X(e, "height", t.height)
		}

		function E(e) {
			X(e, "position", ""), X(e, "top", ""), X(e, "left", ""), X(e, "width", ""), X(e, "height", "")
		}
		var Z = "Sortable" + (new Date).getTime();

		function C() {
			var t, i = [];
			return {
				captureAnimationState: function() {
					i = [], this.options.animation && [].slice.call(this.el.children).forEach(function(e) {
						if ("none" !== X(e, "display") && e !== $e.ghost) {
							i.push({
								target: e,
								rect: Y(e)
							});
							var t = U({}, i[i.length - 1].rect);
							if (e.thisAnimationDuration) {
								var n = g(e, !0);
								n && (t.top -= n.f, t.left -= n.e)
							}
							e.fromRect = t
						}
					})
				},
				addAnimationState: function(e) {
					i.push(e)
				},
				removeAnimationState: function(e) {
					i.splice(function(e, t) {
						for (var n in e)
							if (e.hasOwnProperty(n))
								for (var i in t)
									if (t.hasOwnProperty(i) && t[i] === e[n][i]) return Number(n);
						return -1
					}(i, {
						target: e
					}), 1)
				},
				animateAll: function(e) {
					var h = this;
					if (!this.options.animation) return clearTimeout(t), void("function" == typeof e && e());
					var p = !1,
						m = 0;
					i.forEach(function(e) {
						var t, n, i, o, r = 0,
							a = e.target,
							s = a.fromRect,
							l = Y(a),
							c = a.prevFromRect,
							u = a.prevToRect,
							d = e.rect,
							f = g(a, !0);
						f && (l.top -= f.f, l.left -= f.e), a.toRect = l, a.thisAnimationDuration && v(c, l) && !v(s, l) && (d.top - l.top) / (d.left - l.left) == (s.top - l.top) / (s.left - l.left) && (t = d, n = c, i = u, o = h.options, r = Math.sqrt(Math.pow(n.top - t.top, 2) + Math.pow(n.left - t.left, 2)) / Math.sqrt(Math.pow(n.top - i.top, 2) + Math.pow(n.left - i.left, 2)) * o.animation), v(l, s) || (a.prevFromRect = s, a.prevToRect = l, r = r || h.options.animation, h.animate(a, d, l, r)), r && (p = !0, m = Math.max(m, r), clearTimeout(a.animationResetTimer), a.animationResetTimer = setTimeout(function() {
							a.animationTime = 0, a.prevFromRect = null, a.fromRect = null, a.prevToRect = null, a.thisAnimationDuration = null
						}, r), a.thisAnimationDuration = r)
					}), clearTimeout(t), p ? t = setTimeout(function() {
						"function" == typeof e && e()
					}, m) : "function" == typeof e && e(), i = []
				},
				animate: function(e, t, n, i) {
					if (i) {
						X(e, "transition", ""), X(e, "transform", "");
						var o = g(this.el),
							r = o && o.a,
							a = o && o.d,
							s = (t.left - n.left) / (r || 1),
							l = (t.top - n.top) / (a || 1);
						e.animatingX = !!s, e.animatingY = !!l, X(e, "transform", "translate3d(" + s + "px," + l + "px,0)"), e.offsetWidth, X(e, "transition", "transform " + i + "ms" + (this.options.easing ? " " + this.options.easing : "")), X(e, "transform", "translate3d(0,0,0)"), "number" == typeof e.animated && clearTimeout(e.animated), e.animated = setTimeout(function() {
							X(e, "transition", ""), X(e, "transform", ""), e.animated = !1, e.animatingX = !1, e.animatingY = !1
						}, i)
					}
				}
			}
		}
		var T = [],
			S = {
				initializeByDefault: !0
			},
			D = {
				mount: function(e) {
					for (var t in S) !S.hasOwnProperty(t) || t in e || (e[t] = S[t]);
					T.push(e)
				},
				pluginEvent: function(t, n, i) {
					var e = this;
					this.eventCanceled = !1, i.cancel = function() {
						e.eventCanceled = !0
					};
					var o = t + "Global";
					T.forEach(function(e) {
						n[e.pluginName] && (n[e.pluginName][o] && n[e.pluginName][o](U({
							sortable: n
						}, i)), n.options[e.pluginName] && n[e.pluginName][t] && n[e.pluginName][t](U({
							sortable: n
						}, i)))
					})
				},
				initializePlugins: function(i, o, r, e) {
					for (var t in T.forEach(function(e) {
							var t = e.pluginName;
							if (i.options[t] || e.initializeByDefault) {
								var n = new e(i, o, i.options);
								n.sortable = i, n.options = i.options, i[t] = n, a(r, n.defaults)
							}
						}), i.options)
						if (i.options.hasOwnProperty(t)) {
							var n = this.modifyOption(i, t, i.options[t]);
							void 0 !== n && (i.options[t] = n)
						}
				},
				getEventProperties: function(t, n) {
					var i = {};
					return T.forEach(function(e) {
						"function" == typeof e.eventProperties && a(i, e.eventProperties.call(n[e.pluginName], t))
					}), i
				},
				modifyOption: function(t, n, i) {
					var o;
					return T.forEach(function(e) {
						t[e.pluginName] && e.optionListeners && "function" == typeof e.optionListeners[n] && (o = e.optionListeners[n].call(t[e.pluginName], i))
					}), o
				}
			};

		function A(e) {
			var t = e.sortable,
				n = e.rootEl,
				i = e.name,
				o = e.targetEl,
				r = e.cloneEl,
				a = e.toEl,
				s = e.fromEl,
				l = e.oldIndex,
				c = e.newIndex,
				u = e.oldDraggableIndex,
				d = e.newDraggableIndex,
				f = e.originalEvent,
				h = e.putSortable,
				p = e.extraEventProperties;
			if (t = t || n && n[Z]) {
				var m, g = t.options,
					v = "on" + i.charAt(0).toUpperCase() + i.substr(1);
				!window.CustomEvent || w || _ ? (m = document.createEvent("Event")).initEvent(i, !0, !0) : m = new CustomEvent(i, {
					bubbles: !0,
					cancelable: !0
				}), m.to = a || n, m.from = s || n, m.item = o || n, m.clone = r, m.oldIndex = l, m.newIndex = c, m.oldDraggableIndex = u, m.newDraggableIndex = d, m.originalEvent = f, m.pullMode = h ? h.lastPutMode : void 0;
				var y = U({}, p, D.getEventProperties(i, t));
				for (var b in y) m[b] = y[b];
				n && n.dispatchEvent(m), g[v] && g[v].call(t, m)
			}
		}

		function ee(e, t, n) {
			var i = 2 < arguments.length && void 0 !== n ? n : {},
				o = i.evt,
				r = function(e, t) {
					if (null == e) return {};
					var n, i, o = function(e, t) {
						if (null == e) return {};
						var n, i, o = {},
							r = Object.keys(e);
						for (i = 0; i < r.length; i++) n = r[i], 0 <= t.indexOf(n) || (o[n] = e[n]);
						return o
					}(e, t);
					if (Object.getOwnPropertySymbols) {
						var r = Object.getOwnPropertySymbols(e);
						for (i = 0; i < r.length; i++) n = r[i], 0 <= t.indexOf(n) || Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
					}
					return o
				}(i, ["evt"]);
			D.pluginEvent.bind($e)(e, t, U({
				dragEl: ne,
				parentEl: ie,
				ghostEl: oe,
				rootEl: re,
				nextEl: ae,
				lastDownEl: k,
				cloneEl: N,
				cloneHidden: $,
				dragStarted: W,
				putSortable: ue,
				activeSortable: $e.active,
				originalEvent: o,
				oldIndex: j,
				oldDraggableIndex: P,
				newIndex: se,
				newDraggableIndex: le,
				hideGhostForTarget: ke,
				unhideGhostForTarget: Ne,
				cloneNowHidden: function() {
					$ = !0
				},
				cloneNowShown: function() {
					$ = !1
				},
				dispatchSortableEvent: function(e) {
					te({
						sortable: t,
						name: e,
						originalEvent: o
					})
				}
			}, r))
		}

		function te(e) {
			A(U({
				putSortable: ue,
				cloneEl: N,
				targetEl: ne,
				rootEl: re,
				oldIndex: j,
				oldDraggableIndex: P,
				newIndex: se,
				newDraggableIndex: le
			}, e))
		}
		var ne, ie, oe, re, ae, k, N, $, j, se, P, le, ce, ue, L, M, H, R, q, F, W, de, fe, he, B, pe = !1,
			me = !1,
			ge = [],
			ve = !1,
			ye = !1,
			be = [],
			we = !1,
			_e = [],
			xe = "undefined" != typeof document,
			Ee = t,
			Ce = _ || w ? "cssFloat" : "float",
			Te = xe && !n && !t && "draggable" in document.createElement("div"),
			Se = function() {
				if (xe) {
					if (w) return !1;
					var e = document.createElement("x");
					return e.style.cssText = "pointer-events:auto", "auto" === e.style.pointerEvents
				}
			}(),
			De = function(e, t) {
				var n = X(e),
					i = parseInt(n.width) - parseInt(n.paddingLeft) - parseInt(n.paddingRight) - parseInt(n.borderLeftWidth) - parseInt(n.borderRightWidth),
					o = p(e, 0, t),
					r = p(e, 1, t),
					a = o && X(o),
					s = r && X(r),
					l = a && parseInt(a.marginLeft) + parseInt(a.marginRight) + Y(o).width,
					c = s && parseInt(s.marginLeft) + parseInt(s.marginRight) + Y(r).width;
				if ("flex" === n.display) return "column" === n.flexDirection || "column-reverse" === n.flexDirection ? "vertical" : "horizontal";
				if ("grid" === n.display) return n.gridTemplateColumns.split(" ").length <= 1 ? "vertical" : "horizontal";
				if (o && a.float && "none" !== a.float) {
					var u = "left" === a.float ? "left" : "right";
					return !r || "both" !== s.clear && s.clear !== u ? "horizontal" : "vertical"
				}
				return o && ("block" === a.display || "flex" === a.display || "table" === a.display || "grid" === a.display || i <= l && "none" === n[Ce] || r && "none" === n[Ce] && i < l + c) ? "vertical" : "horizontal"
			},
			Ae = function(e) {
				function l(a, s) {
					return function(e, t, n, i) {
						var o = e.options.group.name && t.options.group.name && e.options.group.name === t.options.group.name;
						if (null == a && (s || o)) return !0;
						if (null == a || !1 === a) return !1;
						if (s && "clone" === a) return a;
						if ("function" == typeof a) return l(a(e, t, n, i), s)(e, t, n, i);
						var r = (s ? e : t).options.group.name;
						return !0 === a || "string" == typeof a && a === r || a.join && -1 < a.indexOf(r)
					}
				}
				var t = {},
					n = e.group;
				n && "object" == i(n) || (n = {
					name: n
				}), t.name = n.name, t.checkPull = l(n.pull, !0), t.checkPut = l(n.put), t.revertClone = n.revertClone, e.group = t
			},
			ke = function() {
				!Se && oe && X(oe, "display", "none")
			},
			Ne = function() {
				!Se && oe && X(oe, "display", "")
			};

		function Ie(e) {
			if (ne) {
				var t = (r = (e = e.touches ? e.touches[0] : e).clientX, a = e.clientY, ge.some(function(e) {
					if (!Q(e)) {
						var t = Y(e),
							n = e[Z].options.emptyInsertThreshold,
							i = r >= t.left - n && r <= t.right + n,
							o = a >= t.top - n && a <= t.bottom + n;
						return n && i && o ? s = e : void 0
					}
				}), s);
				if (t) {
					var n = {};
					for (var i in e) e.hasOwnProperty(i) && (n[i] = e[i]);
					n.target = n.rootEl = t, n.preventDefault = void 0, n.stopPropagation = void 0, t[Z]._onDragOver(n)
				}
			}
			var r, a, s
		}

		function Oe(e) {
			ne && ne.parentNode[Z]._isOutsideThisEl(e.target)
		}

		function $e(e, t) {
			if (!e || !e.nodeType || 1 !== e.nodeType) throw "Sortable: `el` must be an HTMLElement, not ".concat({}.toString.call(e));
			this.el = e, this.options = t = a({}, t), e[Z] = this;
			var n = {
				group: null,
				sort: !0,
				disabled: !1,
				store: null,
				handle: null,
				draggable: /^[uo]l$/i.test(e.nodeName) ? ">li" : ">*",
				swapThreshold: 1,
				invertSwap: !1,
				invertedSwapThreshold: null,
				removeCloneOnHide: !0,
				direction: function() {
					return De(e, this.options)
				},
				ghostClass: "sortable-ghost",
				chosenClass: "sortable-chosen",
				dragClass: "sortable-drag",
				ignore: "a, img",
				filter: null,
				preventOnFilter: !0,
				animation: 0,
				easing: null,
				setData: function(e, t) {
					e.setData("Text", t.textContent)
				},
				dropBubble: !1,
				dragoverBubble: !1,
				dataIdAttr: "data-id",
				delay: 0,
				delayOnTouchOnly: !1,
				touchStartThreshold: (Number.parseInt ? Number : window).parseInt(window.devicePixelRatio, 10) || 1,
				forceFallback: !1,
				fallbackClass: "sortable-fallback",
				fallbackOnBody: !1,
				fallbackTolerance: 0,
				fallbackOffset: {
					x: 0,
					y: 0
				},
				supportPointer: !1 !== $e.supportPointer && "PointerEvent" in window,
				emptyInsertThreshold: 5
			};
			for (var i in D.initializePlugins(this, e, n), n) i in t || (t[i] = n[i]);
			for (var o in Ae(t), this) "_" === o.charAt(0) && "function" == typeof this[o] && (this[o] = this[o].bind(this));
			this.nativeDraggable = !t.forceFallback && Te, this.nativeDraggable && (this.options.touchStartThreshold = 1), t.supportPointer ? u(e, "pointerdown", this._onTapStart) : (u(e, "mousedown", this._onTapStart), u(e, "touchstart", this._onTapStart)), this.nativeDraggable && (u(e, "dragover", this), u(e, "dragenter", this)), ge.push(this.el), t.store && t.store.get && this.sort(t.store.get(this) || []), a(this, C())
		}

		function je(e, t, n, i, o, r, a, s) {
			var l, c, u = e[Z],
				d = u.options.onMove;
			return !window.CustomEvent || w || _ ? (l = document.createEvent("Event")).initEvent("move", !0, !0) : l = new CustomEvent("move", {
				bubbles: !0,
				cancelable: !0
			}), l.to = t, l.from = e, l.dragged = n, l.draggedRect = i, l.related = o || t, l.relatedRect = r || Y(t), l.willInsertAfter = s, l.originalEvent = a, e.dispatchEvent(l), d && (c = d.call(u, l, a)), c
		}

		function Pe(e) {
			e.draggable = !1
		}

		function Le() {
			we = !1
		}

		function Me(e) {
			for (var t = e.tagName + e.className + e.src + e.href + e.textContent, n = t.length, i = 0; n--;) i += t.charCodeAt(n);
			return i.toString(36)
		}

		function He(e) {
			return setTimeout(e, 0)
		}

		function Re(e) {
			return clearTimeout(e)
		}
		xe && document.addEventListener("click", function(e) {
			if (me) return e.preventDefault(), e.stopPropagation && e.stopPropagation(), e.stopImmediatePropagation && e.stopImmediatePropagation(), me = !1
		}, !0), $e.prototype = {
			constructor: $e,
			_isOutsideThisEl: function(e) {
				this.el.contains(e) || e === this.el || (de = null)
			},
			_getDirection: function(e, t) {
				return "function" == typeof this.options.direction ? this.options.direction.call(this, e, t, ne) : this.options.direction
			},
			_onTapStart: function(t) {
				if (t.cancelable) {
					var n = this,
						i = this.el,
						e = this.options,
						o = e.preventOnFilter,
						r = t.type,
						a = t.touches && t.touches[0] || t.pointerType && "touch" === t.pointerType && t,
						s = (a || t).target,
						l = t.target.shadowRoot && (t.path && t.path[0] || t.composedPath && t.composedPath()[0]) || s,
						c = e.filter;
					if (function(e) {
							_e.length = 0;
							for (var t = e.getElementsByTagName("input"), n = t.length; n--;) {
								var i = t[n];
								i.checked && _e.push(i)
							}
						}(i), !ne && !(/mousedown|pointerdown/.test(r) && 0 !== t.button || e.disabled || l.isContentEditable || (s = K(s, e.draggable, i, !1)) && s.animated || k === s)) {
						if (j = G(s), P = G(s, e.draggable), "function" == typeof c) {
							if (c.call(this, t, s, this)) return te({
								sortable: n,
								rootEl: l,
								name: "filter",
								targetEl: s,
								toEl: i,
								fromEl: i
							}), ee("filter", n, {
								evt: t
							}), void(o && t.cancelable && t.preventDefault())
						} else if (c = c && c.split(",").some(function(e) {
								if (e = K(l, e.trim(), i, !1)) return te({
									sortable: n,
									rootEl: e,
									name: "filter",
									targetEl: s,
									fromEl: i,
									toEl: i
								}), ee("filter", n, {
									evt: t
								}), !0
							})) return void(o && t.cancelable && t.preventDefault());
						e.handle && !K(l, e.handle, i, !1) || this._prepareDragStart(t, a, s)
					}
				}
			},
			_prepareDragStart: function(e, t, n) {
				var i, o = this,
					r = o.el,
					a = o.options,
					s = r.ownerDocument;
				if (n && !ne && n.parentNode === r) {
					var l = Y(n);
					if (re = r, ie = (ne = n).parentNode, ae = ne.nextSibling, k = n, ce = a.group, L = {
							target: $e.dragged = ne,
							clientX: (t || e).clientX,
							clientY: (t || e).clientY
						}, q = L.clientX - l.left, F = L.clientY - l.top, this._lastX = (t || e).clientX, this._lastY = (t || e).clientY, ne.style["will-change"] = "all", i = function() {
							ee("delayEnded", o, {
								evt: e
							}), $e.eventCanceled ? o._onDrop() : (o._disableDelayedDragEvents(), !c && o.nativeDraggable && (ne.draggable = !0), o._triggerDragStart(e, t), te({
								sortable: o,
								name: "choose",
								originalEvent: e
							}), V(ne, a.chosenClass, !0))
						}, a.ignore.split(",").forEach(function(e) {
							h(ne, e.trim(), Pe)
						}), u(s, "dragover", Ie), u(s, "mousemove", Ie), u(s, "touchmove", Ie), u(s, "mouseup", o._onDrop), u(s, "touchend", o._onDrop), u(s, "touchcancel", o._onDrop), c && this.nativeDraggable && (this.options.touchStartThreshold = 4, ne.draggable = !0), ee("delayStart", this, {
							evt: e
						}), !a.delay || a.delayOnTouchOnly && !t || this.nativeDraggable && (_ || w)) i();
					else {
						if ($e.eventCanceled) return void this._onDrop();
						u(s, "mouseup", o._disableDelayedDrag), u(s, "touchend", o._disableDelayedDrag), u(s, "touchcancel", o._disableDelayedDrag), u(s, "mousemove", o._delayedDragTouchMoveHandler), u(s, "touchmove", o._delayedDragTouchMoveHandler), a.supportPointer && u(s, "pointermove", o._delayedDragTouchMoveHandler), o._dragStartTimer = setTimeout(i, a.delay)
					}
				}
			},
			_delayedDragTouchMoveHandler: function(e) {
				var t = e.touches ? e.touches[0] : e;
				Math.max(Math.abs(t.clientX - this._lastX), Math.abs(t.clientY - this._lastY)) >= Math.floor(this.options.touchStartThreshold / (this.nativeDraggable && window.devicePixelRatio || 1)) && this._disableDelayedDrag()
			},
			_disableDelayedDrag: function() {
				ne && Pe(ne), clearTimeout(this._dragStartTimer), this._disableDelayedDragEvents()
			},
			_disableDelayedDragEvents: function() {
				var e = this.el.ownerDocument;
				r(e, "mouseup", this._disableDelayedDrag), r(e, "touchend", this._disableDelayedDrag), r(e, "touchcancel", this._disableDelayedDrag), r(e, "mousemove", this._delayedDragTouchMoveHandler), r(e, "touchmove", this._delayedDragTouchMoveHandler), r(e, "pointermove", this._delayedDragTouchMoveHandler)
			},
			_triggerDragStart: function(e, t) {
				t = t || "touch" == e.pointerType && e, !this.nativeDraggable || t ? this.options.supportPointer ? u(document, "pointermove", this._onTouchMove) : u(document, t ? "touchmove" : "mousemove", this._onTouchMove) : (u(ne, "dragend", this), u(re, "dragstart", this._onDragStart));
				try {
					document.selection ? He(function() {
						document.selection.empty()
					}) : window.getSelection().removeAllRanges()
				} catch (e) {}
			},
			_dragStarted: function(e, t) {
				if (pe = !1, re && ne) {
					ee("dragStarted", this, {
						evt: t
					}), this.nativeDraggable && u(document, "dragover", Oe);
					var n = this.options;
					e || V(ne, n.dragClass, !1), V(ne, n.ghostClass, !0), $e.active = this, e && this._appendGhost(), te({
						sortable: this,
						name: "start",
						originalEvent: t
					})
				} else this._nulling()
			},
			_emulateDragOver: function() {
				if (M) {
					this._lastX = M.clientX, this._lastY = M.clientY, ke();
					for (var e = document.elementFromPoint(M.clientX, M.clientY), t = e; e && e.shadowRoot && (e = e.shadowRoot.elementFromPoint(M.clientX, M.clientY)) !== t;) t = e;
					if (ne.parentNode[Z]._isOutsideThisEl(e), t)
						do {
							if (t[Z] && t[Z]._onDragOver({
									clientX: M.clientX,
									clientY: M.clientY,
									target: e,
									rootEl: t
								}) && !this.options.dragoverBubble) break;
							e = t
						} while (t = t.parentNode);
					Ne()
				}
			},
			_onTouchMove: function(e) {
				if (L) {
					var t = this.options,
						n = t.fallbackTolerance,
						i = t.fallbackOffset,
						o = e.touches ? e.touches[0] : e,
						r = oe && g(oe, !0),
						a = oe && r && r.a,
						s = oe && r && r.d,
						l = Ee && B && m(B),
						c = (o.clientX - L.clientX + i.x) / (a || 1) + (l ? l[0] - be[0] : 0) / (a || 1),
						u = (o.clientY - L.clientY + i.y) / (s || 1) + (l ? l[1] - be[1] : 0) / (s || 1);
					if (!$e.active && !pe) {
						if (n && Math.max(Math.abs(o.clientX - this._lastX), Math.abs(o.clientY - this._lastY)) < n) return;
						this._onDragStart(e, !0)
					}
					if (oe) {
						r ? (r.e += c - (H || 0), r.f += u - (R || 0)) : r = {
							a: 1,
							b: 0,
							c: 0,
							d: 1,
							e: c,
							f: u
						};
						var d = "matrix(".concat(r.a, ",").concat(r.b, ",").concat(r.c, ",").concat(r.d, ",").concat(r.e, ",").concat(r.f, ")");
						X(oe, "webkitTransform", d), X(oe, "mozTransform", d), X(oe, "msTransform", d), X(oe, "transform", d), H = c, R = u, M = o
					}
					e.cancelable && e.preventDefault()
				}
			},
			_appendGhost: function() {
				if (!oe) {
					var e = this.options.fallbackOnBody ? document.body : re,
						t = Y(ne, !0, Ee, !0, e),
						n = this.options;
					if (Ee) {
						for (B = e;
							"static" === X(B, "position") && "none" === X(B, "transform") && B !== document;) B = B.parentNode;
						B !== document.body && B !== document.documentElement ? (B === document && (B = I()), t.top += B.scrollTop, t.left += B.scrollLeft) : B = I(), be = m(B)
					}
					V(oe = ne.cloneNode(!0), n.ghostClass, !1), V(oe, n.fallbackClass, !0), V(oe, n.dragClass, !0), X(oe, "transition", ""), X(oe, "transform", ""), X(oe, "box-sizing", "border-box"), X(oe, "margin", 0), X(oe, "top", t.top), X(oe, "left", t.left), X(oe, "width", t.width), X(oe, "height", t.height), X(oe, "opacity", "0.8"), X(oe, "position", Ee ? "absolute" : "fixed"), X(oe, "zIndex", "100000"), X(oe, "pointerEvents", "none"), $e.ghost = oe, e.appendChild(oe), X(oe, "transform-origin", q / parseInt(oe.style.width) * 100 + "% " + F / parseInt(oe.style.height) * 100 + "%")
				}
			},
			_onDragStart: function(e, t) {
				var n = this,
					i = e.dataTransfer,
					o = n.options;
				ee("dragStart", this, {
					evt: e
				}), $e.eventCanceled ? this._onDrop() : (ee("setupClone", this), $e.eventCanceled || ((N = b(ne)).draggable = !1, N.style["will-change"] = "", this._hideClone(), V(N, this.options.chosenClass, !1), $e.clone = N), n.cloneId = He(function() {
					ee("clone", n), $e.eventCanceled || (n.options.removeCloneOnHide || re.insertBefore(N, ne), n._hideClone(), te({
						sortable: n,
						name: "clone"
					}))
				}), t || V(ne, o.dragClass, !0), t ? (me = !0, n._loopId = setInterval(n._emulateDragOver, 50)) : (r(document, "mouseup", n._onDrop), r(document, "touchend", n._onDrop), r(document, "touchcancel", n._onDrop), i && (i.effectAllowed = "move", o.setData && o.setData.call(n, i, ne)), u(document, "drop", n), X(ne, "transform", "translateZ(0)")), pe = !0, n._dragStartId = He(n._dragStarted.bind(n, t, e)), u(document, "selectstart", n), W = !0, s && X(document.body, "user-select", "none"))
			},
			_onDragOver: function(d) {
				var n, f, i, h, e, t, o, r, a, s, l, c, u, p, m, g, v = this.el,
					y = d.target,
					b = this.options,
					w = b.group,
					_ = $e.active,
					x = ce === w,
					E = b.sort,
					C = ue || _,
					T = this,
					S = !1;
				if (!we) {
					if (void 0 !== d.preventDefault && d.cancelable && d.preventDefault(), y = K(y, b.draggable, v, !0), q("dragOver"), $e.eventCanceled) return S;
					if (ne.contains(d.target) || y.animated && y.animatingX && y.animatingY || T._ignoreWhileAnimating === y) return W(!1);
					if (me = !1, _ && !b.disabled && (x ? E || (i = !re.contains(ne)) : ue === this || (this.lastPutMode = ce.checkPull(this, _, ne, d)) && w.checkPut(this, _, ne, d))) {
						if (h = "vertical" === this._getDirection(d, y), n = Y(ne), q("dragOverValid"), $e.eventCanceled) return S;
						if (i) return ie = re, F(), this._hideClone(), q("revert"), $e.eventCanceled || (ae ? re.insertBefore(ne, ae) : re.appendChild(ne)), W(!0);
						var D = Q(v, b.draggable);
						if (D && (u = d, p = h, g = Y(Q((m = this).el, m.options.draggable)), !(p ? u.clientX > g.right + 10 || u.clientX <= g.right && u.clientY > g.bottom && u.clientX >= g.left : u.clientX > g.right && u.clientY > g.top || u.clientX <= g.right && u.clientY > g.bottom + 10) || D.animated)) {
							if (y.parentNode === v) {
								f = Y(y);
								var A, k, N, I = ne.parentNode !== v,
									O = (e = ne.animated && ne.toRect || n, t = y.animated && y.toRect || f, o = h ? e.left : e.top, r = h ? e.right : e.bottom, a = h ? e.width : e.height, s = h ? t.left : t.top, l = h ? t.right : t.bottom, c = h ? t.width : t.height, !(o === s || r === l || o + a / 2 === s + c / 2)),
									$ = h ? "top" : "left",
									j = z(y, "top", "top") || z(ne, "top", "top"),
									P = j ? j.scrollTop : void 0;
								if (de !== y && (k = f[$], ve = !1, ye = !O && b.invertSwap || I), 0 !== (A = function(e, t, n, i, o) {
										var r, a = h ? d.clientY : d.clientX,
											s = h ? f.height : f.width,
											l = h ? f.top : f.left,
											c = h ? f.bottom : f.right,
											u = !1;
										if (!i)
											if (o && he < s * t) {
												if (!ve && (1 === fe ? l + s * n / 2 < a : a < c - s * n / 2) && (ve = !0), ve) u = !0;
												else if (1 === fe ? a < l + he : c - he < a) return -fe
											} else if (l + s * (1 - t) / 2 < a && a < c - s * (1 - t) / 2) return r = e, G(ne) < G(r) ? 1 : -1;
										return (u = u || i) && (a < l + s * n / 2 || c - s * n / 2 < a) ? l + s / 2 < a ? 1 : -1 : 0
									}(y, O ? 1 : b.swapThreshold, null == b.invertedSwapThreshold ? b.swapThreshold : b.invertedSwapThreshold, ye, de === y)))
									for (var L = G(ne); L -= A, (N = ie.children[L]) && ("none" === X(N, "display") || N === oe););
								if (0 === A || N === y) return W(!1);
								fe = A;
								var M = (de = y).nextElementSibling,
									H = !1,
									R = je(re, v, ne, n, y, f, d, H = 1 === A);
								if (!1 !== R) return 1 !== R && -1 !== R || (H = 1 === R), we = !0, setTimeout(Le, 30), F(), H && !M ? v.appendChild(ne) : y.parentNode.insertBefore(ne, H ? M : y), j && J(j, 0, P - j.scrollTop), ie = ne.parentNode, void 0 === k || ye || (he = Math.abs(k - Y(y)[$])), B(), W(!0)
							}
						} else {
							if (D === ne) return W(!1);
							if (D && v === d.target && (y = D), y && (f = Y(y)), !1 !== je(re, v, ne, n, y, f, d, !!y)) return F(), v.appendChild(ne), ie = v, B(), W(!0)
						}
						if (v.contains(ne)) return W(!1)
					}
					return !1
				}

				function q(e, t) {
					ee(e, T, U({
						evt: d,
						isOwner: x,
						axis: h ? "vertical" : "horizontal",
						revert: i,
						dragRect: n,
						targetRect: f,
						canSort: E,
						fromSortable: C,
						target: y,
						completed: W,
						onMove: function(e, t) {
							return je(re, v, ne, n, e, Y(e), d, t)
						},
						changed: B
					}, t))
				}

				function F() {
					q("dragOverAnimationCapture"), T.captureAnimationState(), T !== C && C.captureAnimationState()
				}

				function W(e) {
					return q("dragOverCompleted", {
						insertion: e
					}), e && (x ? _._hideClone() : _._showClone(T), T !== C && (V(ne, ue ? ue.options.ghostClass : _.options.ghostClass, !1), V(ne, b.ghostClass, !0)), ue !== T && T !== $e.active ? ue = T : T === $e.active && ue && (ue = null), C === T && (T._ignoreWhileAnimating = y), T.animateAll(function() {
						q("dragOverAnimationComplete"), T._ignoreWhileAnimating = null
					}), T !== C && (C.animateAll(), C._ignoreWhileAnimating = null)), (y === ne && !ne.animated || y === v && !y.animated) && (de = null), b.dragoverBubble || d.rootEl || y === document || (ne.parentNode[Z]._isOutsideThisEl(d.target), e || Ie(d)), !b.dragoverBubble && d.stopPropagation && d.stopPropagation(), S = !0
				}

				function B() {
					se = G(ne), le = G(ne, b.draggable), te({
						sortable: T,
						name: "change",
						toEl: v,
						newIndex: se,
						newDraggableIndex: le,
						originalEvent: d
					})
				}
			},
			_ignoreWhileAnimating: null,
			_offMoveEvents: function() {
				r(document, "mousemove", this._onTouchMove), r(document, "touchmove", this._onTouchMove), r(document, "pointermove", this._onTouchMove), r(document, "dragover", Ie), r(document, "mousemove", Ie), r(document, "touchmove", Ie)
			},
			_offUpEvents: function() {
				var e = this.el.ownerDocument;
				r(e, "mouseup", this._onDrop), r(e, "touchend", this._onDrop), r(e, "pointerup", this._onDrop), r(e, "touchcancel", this._onDrop), r(document, "selectstart", this)
			},
			_onDrop: function(e) {
				var t = this.el,
					n = this.options;
				se = G(ne), le = G(ne, n.draggable), ee("drop", this, {
					evt: e
				}), ie = ne && ne.parentNode, se = G(ne), le = G(ne, n.draggable), $e.eventCanceled || (ve = ye = pe = !1, clearInterval(this._loopId), clearTimeout(this._dragStartTimer), Re(this.cloneId), Re(this._dragStartId), this.nativeDraggable && (r(document, "drop", this), r(t, "dragstart", this._onDragStart)), this._offMoveEvents(), this._offUpEvents(), s && X(document.body, "user-select", ""), X(ne, "transform", ""), e && (W && (e.cancelable && e.preventDefault(), n.dropBubble || e.stopPropagation()), oe && oe.parentNode && oe.parentNode.removeChild(oe), (re === ie || ue && "clone" !== ue.lastPutMode) && N && N.parentNode && N.parentNode.removeChild(N), ne && (this.nativeDraggable && r(ne, "dragend", this), Pe(ne), ne.style["will-change"] = "", W && !pe && V(ne, ue ? ue.options.ghostClass : this.options.ghostClass, !1), V(ne, this.options.chosenClass, !1), te({
					sortable: this,
					name: "unchoose",
					toEl: ie,
					newIndex: null,
					newDraggableIndex: null,
					originalEvent: e
				}), re !== ie ? (0 <= se && (te({
					rootEl: ie,
					name: "add",
					toEl: ie,
					fromEl: re,
					originalEvent: e
				}), te({
					sortable: this,
					name: "remove",
					toEl: ie,
					originalEvent: e
				}), te({
					rootEl: ie,
					name: "sort",
					toEl: ie,
					fromEl: re,
					originalEvent: e
				}), te({
					sortable: this,
					name: "sort",
					toEl: ie,
					originalEvent: e
				})), ue && ue.save()) : se !== j && 0 <= se && (te({
					sortable: this,
					name: "update",
					toEl: ie,
					originalEvent: e
				}), te({
					sortable: this,
					name: "sort",
					toEl: ie,
					originalEvent: e
				})), $e.active && (null != se && -1 !== se || (se = j, le = P), te({
					sortable: this,
					name: "end",
					toEl: ie,
					originalEvent: e
				}), this.save())))), this._nulling()
			},
			_nulling: function() {
				ee("nulling", this), re = ne = ie = oe = ae = N = k = $ = L = M = W = se = le = j = P = de = fe = ue = ce = $e.dragged = $e.ghost = $e.clone = $e.active = null, _e.forEach(function(e) {
					e.checked = !0
				}), _e.length = H = R = 0
			},
			handleEvent: function(e) {
				switch (e.type) {
					case "drop":
					case "dragend":
						this._onDrop(e);
						break;
					case "dragenter":
					case "dragover":
						ne && (this._onDragOver(e), (t = e).dataTransfer && (t.dataTransfer.dropEffect = "move"), t.cancelable && t.preventDefault());
						break;
					case "selectstart":
						e.preventDefault()
				}
				var t
			},
			toArray: function() {
				for (var e, t = [], n = this.el.children, i = 0, o = n.length, r = this.options; i < o; i++) K(e = n[i], r.draggable, this.el, !1) && t.push(e.getAttribute(r.dataIdAttr) || Me(e));
				return t
			},
			sort: function(e) {
				var i = {},
					o = this.el;
				this.toArray().forEach(function(e, t) {
					var n = o.children[t];
					K(n, this.options.draggable, o, !1) && (i[e] = n)
				}, this), e.forEach(function(e) {
					i[e] && (o.removeChild(i[e]), o.appendChild(i[e]))
				})
			},
			save: function() {
				var e = this.options.store;
				e && e.set && e.set(this)
			},
			closest: function(e, t) {
				return K(e, t || this.options.draggable, this.el, !1)
			},
			option: function(e, t) {
				var n = this.options;
				if (void 0 === t) return n[e];
				var i = D.modifyOption(this, e, t);
				n[e] = void 0 !== i ? i : t, "group" === e && Ae(n)
			},
			destroy: function() {
				ee("destroy", this);
				var e = this.el;
				e[Z] = null, r(e, "mousedown", this._onTapStart), r(e, "touchstart", this._onTapStart), r(e, "pointerdown", this._onTapStart), this.nativeDraggable && (r(e, "dragover", this), r(e, "dragenter", this)), Array.prototype.forEach.call(e.querySelectorAll("[draggable]"), function(e) {
					e.removeAttribute("draggable")
				}), this._onDrop(), this._disableDelayedDragEvents(), ge.splice(ge.indexOf(this.el), 1), this.el = e = null
			},
			_hideClone: function() {
				if (!$) {
					if (ee("hideClone", this), $e.eventCanceled) return;
					X(N, "display", "none"), this.options.removeCloneOnHide && N.parentNode && N.parentNode.removeChild(N), $ = !0
				}
			},
			_showClone: function(e) {
				if ("clone" === e.lastPutMode) {
					if ($) {
						if (ee("showClone", this), $e.eventCanceled) return;
						re.contains(ne) && !this.options.group.revertClone ? re.insertBefore(N, ne) : ae ? re.insertBefore(N, ae) : re.appendChild(N), this.options.group.revertClone && this.animate(ne, N), X(N, "display", ""), $ = !1
					}
				} else this._hideClone()
			}
		}, xe && u(document, "touchmove", function(e) {
			($e.active || pe) && e.cancelable && e.preventDefault()
		}), $e.utils = {
			on: u,
			off: r,
			css: X,
			find: h,
			is: function(e, t) {
				return !!K(e, t, e, !1)
			},
			extend: function(e, t) {
				if (e && t)
					for (var n in t) t.hasOwnProperty(n) && (e[n] = t[n]);
				return e
			},
			throttle: y,
			closest: K,
			toggleClass: V,
			clone: b,
			index: G,
			nextTick: He,
			cancelNextTick: Re,
			detectDirection: De,
			getChild: p
		}, $e.get = function(e) {
			return e[Z]
		}, $e.mount = function() {
			for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
			t[0].constructor === Array && (t = t[0]), t.forEach(function(e) {
				if (!e.prototype || !e.prototype.constructor) throw "Sortable: Mounted plugin must be a constructor function, not ".concat({}.toString.call(e));
				e.utils && ($e.utils = U({}, $e.utils, e.utils)), D.mount(e)
			})
		}, $e.create = function(e, t) {
			return new $e(e, t)
		};
		var qe, Fe, We, Be, Ue, Ke, Ve = [],
			Xe = !($e.version = "1.10.2");

		function Ye() {
			Ve.forEach(function(e) {
				clearInterval(e.pid)
			}), Ve = []
		}

		function ze() {
			clearInterval(Ke)
		}

		function Qe(e) {
			var t = e.originalEvent,
				n = e.putSortable,
				i = e.dragEl,
				o = e.activeSortable,
				r = e.dispatchSortableEvent,
				a = e.hideGhostForTarget,
				s = e.unhideGhostForTarget;
			if (t) {
				var l = n || o;
				a();
				var c = t.changedTouches && t.changedTouches.length ? t.changedTouches[0] : t,
					u = document.elementFromPoint(c.clientX, c.clientY);
				s(), l && !l.el.contains(u) && (r("spill"), this.onSpill({
					dragEl: i,
					putSortable: n
				}))
			}
		}
		var Ge, Je = y(function(n, e, t, i) {
			if (e.scroll) {
				var o, r = (n.touches ? n.touches[0] : n).clientX,
					a = (n.touches ? n.touches[0] : n).clientY,
					s = e.scrollSensitivity,
					l = e.scrollSpeed,
					c = I(),
					u = !1;
				Fe !== t && (Fe = t, Ye(), qe = e.scroll, o = e.scrollFn, !0 === qe && (qe = O(t, !0)));
				var d = 0,
					f = qe;
				do {
					var h, p = f,
						m = Y(p),
						g = m.top,
						v = m.bottom,
						y = m.left,
						b = m.right,
						w = m.width,
						_ = m.height,
						x = void 0,
						E = p.scrollWidth,
						C = p.scrollHeight,
						T = X(p),
						S = p.scrollLeft,
						D = p.scrollTop;
					h = p === c ? (x = w < E && ("auto" === T.overflowX || "scroll" === T.overflowX || "visible" === T.overflowX), _ < C && ("auto" === T.overflowY || "scroll" === T.overflowY || "visible" === T.overflowY)) : (x = w < E && ("auto" === T.overflowX || "scroll" === T.overflowX), _ < C && ("auto" === T.overflowY || "scroll" === T.overflowY));
					var A = x && (Math.abs(b - r) <= s && S + w < E) - (Math.abs(y - r) <= s && !!S),
						k = h && (Math.abs(v - a) <= s && D + _ < C) - (Math.abs(g - a) <= s && !!D);
					if (!Ve[d])
						for (var N = 0; N <= d; N++) Ve[N] || (Ve[N] = {});
					Ve[d].vx == A && Ve[d].vy == k && Ve[d].el === p || (Ve[d].el = p, Ve[d].vx = A, Ve[d].vy = k, clearInterval(Ve[d].pid), 0 == A && 0 == k || (u = !0, Ve[d].pid = setInterval(function() {
						i && 0 === this.layer && $e.active._onTouchMove(Ue);
						var e = Ve[this.layer].vy ? Ve[this.layer].vy * l : 0,
							t = Ve[this.layer].vx ? Ve[this.layer].vx * l : 0;
						"function" == typeof o && "continue" !== o.call($e.dragged.parentNode[Z], t, e, n, Ue, Ve[this.layer].el) || J(Ve[this.layer].el, t, e)
					}.bind({
						layer: d
					}), 24))), d++
				} while (e.bubbleScroll && f !== c && (f = O(f, !1)));
				Xe = u
			}
		}, 30);

		function Ze() {}

		function et() {}
		Ze.prototype = {
			startIndex: null,
			dragStart: function(e) {
				var t = e.oldDraggableIndex;
				this.startIndex = t
			},
			onSpill: function(e) {
				var t = e.dragEl,
					n = e.putSortable;
				this.sortable.captureAnimationState(), n && n.captureAnimationState();
				var i = p(this.sortable.el, this.startIndex, this.options);
				i ? this.sortable.el.insertBefore(t, i) : this.sortable.el.appendChild(t), this.sortable.animateAll(), n && n.animateAll()
			},
			drop: Qe
		}, a(Ze, {
			pluginName: "revertOnSpill"
		}), et.prototype = {
			onSpill: function(e) {
				var t = e.dragEl,
					n = e.putSortable || this.sortable;
				n.captureAnimationState(), t.parentNode && t.parentNode.removeChild(t), n.animateAll()
			},
			drop: Qe
		}, a(et, {
			pluginName: "removeOnSpill"
		});
		var tt, nt, it, ot, rt, at = [],
			st = [],
			lt = !1,
			ct = !1,
			ut = !1;

		function dt(i, o) {
			st.forEach(function(e, t) {
				var n = o.children[e.sortableIndex + (i ? Number(t) : 0)];
				n ? o.insertBefore(e, n) : o.appendChild(e)
			})
		}

		function ft() {
			at.forEach(function(e) {
				e !== it && e.parentNode && e.parentNode.removeChild(e)
			})
		}
		return $e.mount(new function() {
			function e() {
				for (var e in this.defaults = {
						scroll: !0,
						scrollSensitivity: 30,
						scrollSpeed: 10,
						bubbleScroll: !0
					}, this) "_" === e.charAt(0) && "function" == typeof this[e] && (this[e] = this[e].bind(this))
			}
			return e.prototype = {
				dragStarted: function(e) {
					var t = e.originalEvent;
					this.sortable.nativeDraggable ? u(document, "dragover", this._handleAutoScroll) : this.options.supportPointer ? u(document, "pointermove", this._handleFallbackAutoScroll) : t.touches ? u(document, "touchmove", this._handleFallbackAutoScroll) : u(document, "mousemove", this._handleFallbackAutoScroll)
				},
				dragOverCompleted: function(e) {
					var t = e.originalEvent;
					this.options.dragOverBubble || t.rootEl || this._handleAutoScroll(t)
				},
				drop: function() {
					this.sortable.nativeDraggable ? r(document, "dragover", this._handleAutoScroll) : (r(document, "pointermove", this._handleFallbackAutoScroll), r(document, "touchmove", this._handleFallbackAutoScroll), r(document, "mousemove", this._handleFallbackAutoScroll)), ze(), Ye(), clearTimeout(d), d = void 0
				},
				nulling: function() {
					Ue = Fe = qe = Xe = Ke = We = Be = null, Ve.length = 0
				},
				_handleFallbackAutoScroll: function(e) {
					this._handleAutoScroll(e, !0)
				},
				_handleAutoScroll: function(t, n) {
					var i = this,
						o = (t.touches ? t.touches[0] : t).clientX,
						r = (t.touches ? t.touches[0] : t).clientY,
						e = document.elementFromPoint(o, r);
					if (Ue = t, n || _ || w || s) {
						Je(t, this.options, e, n);
						var a = O(e, !0);
						!Xe || Ke && o === We && r === Be || (Ke && ze(), Ke = setInterval(function() {
							var e = O(document.elementFromPoint(o, r), !0);
							e !== a && (a = e, Ye()), Je(t, i.options, e, n)
						}, 10), We = o, Be = r)
					} else {
						if (!this.options.bubbleScroll || O(e, !0) === I()) return void Ye();
						Je(t, this.options, O(e, !1), !1)
					}
				}
			}, a(e, {
				pluginName: "scroll",
				initializeByDefault: !0
			})
		}), $e.mount(et, Ze), $e.mount(new function() {
			function e() {
				this.defaults = {
					swapClass: "sortable-swap-highlight"
				}
			}
			return e.prototype = {
				dragStart: function(e) {
					var t = e.dragEl;
					Ge = t
				},
				dragOverValid: function(e) {
					var t = e.completed,
						n = e.target,
						i = e.onMove,
						o = e.activeSortable,
						r = e.changed,
						a = e.cancel;
					if (o.options.swap) {
						var s = this.sortable.el,
							l = this.options;
						if (n && n !== s) {
							var c = Ge;
							Ge = !1 !== i(n) ? (V(n, l.swapClass, !0), n) : null, c && c !== Ge && V(c, l.swapClass, !1)
						}
						r(), t(!0), a()
					}
				},
				drop: function(e) {
					var t, n, i, o, r, a, s = e.activeSortable,
						l = e.putSortable,
						c = e.dragEl,
						u = l || this.sortable,
						d = this.options;
					Ge && V(Ge, d.swapClass, !1), Ge && (d.swap || l && l.options.swap) && c !== Ge && (u.captureAnimationState(), u !== s && s.captureAnimationState(), n = Ge, r = (t = c).parentNode, a = n.parentNode, r && a && !r.isEqualNode(n) && !a.isEqualNode(t) && (i = G(t), o = G(n), r.isEqualNode(a) && i < o && o++, r.insertBefore(n, r.children[i]), a.insertBefore(t, a.children[o])), u.animateAll(), u !== s && s.animateAll())
				},
				nulling: function() {
					Ge = null
				}
			}, a(e, {
				pluginName: "swap",
				eventProperties: function() {
					return {
						swapItem: Ge
					}
				}
			})
		}), $e.mount(new function() {
			function e(i) {
				for (var e in this) "_" === e.charAt(0) && "function" == typeof this[e] && (this[e] = this[e].bind(this));
				i.options.supportPointer ? u(document, "pointerup", this._deselectMultiDrag) : (u(document, "mouseup", this._deselectMultiDrag), u(document, "touchend", this._deselectMultiDrag)), u(document, "keydown", this._checkKeyDown), u(document, "keyup", this._checkKeyUp), this.defaults = {
					selectedClass: "sortable-selected",
					multiDragKey: null,
					setData: function(e, t) {
						var n = "";
						at.length && nt === i ? at.forEach(function(e, t) {
							n += (t ? ", " : "") + e.textContent
						}) : n = t.textContent, e.setData("Text", n)
					}
				}
			}
			return e.prototype = {
				multiDragKeyDown: !1,
				isMultiDrag: !1,
				delayStartGlobal: function(e) {
					var t = e.dragEl;
					it = t
				},
				delayEnded: function() {
					this.isMultiDrag = ~at.indexOf(it)
				},
				setupClone: function(e) {
					var t = e.sortable,
						n = e.cancel;
					if (this.isMultiDrag) {
						for (var i = 0; i < at.length; i++) st.push(b(at[i])), st[i].sortableIndex = at[i].sortableIndex, st[i].draggable = !1, st[i].style["will-change"] = "", V(st[i], this.options.selectedClass, !1), at[i] === it && V(st[i], this.options.chosenClass, !1);
						t._hideClone(), n()
					}
				},
				clone: function(e) {
					var t = e.sortable,
						n = e.rootEl,
						i = e.dispatchSortableEvent,
						o = e.cancel;
					this.isMultiDrag && (this.options.removeCloneOnHide || at.length && nt === t && (dt(!0, n), i("clone"), o()))
				},
				showClone: function(e) {
					var t = e.cloneNowShown,
						n = e.rootEl,
						i = e.cancel;
					this.isMultiDrag && (dt(!1, n), st.forEach(function(e) {
						X(e, "display", "")
					}), t(), rt = !1, i())
				},
				hideClone: function(e) {
					var t = this,
						n = (e.sortable, e.cloneNowHidden),
						i = e.cancel;
					this.isMultiDrag && (st.forEach(function(e) {
						X(e, "display", "none"), t.options.removeCloneOnHide && e.parentNode && e.parentNode.removeChild(e)
					}), n(), rt = !0, i())
				},
				dragStartGlobal: function(e) {
					e.sortable, !this.isMultiDrag && nt && nt.multiDrag._deselectMultiDrag(), at.forEach(function(e) {
						e.sortableIndex = G(e)
					}), at = at.sort(function(e, t) {
						return e.sortableIndex - t.sortableIndex
					}), ut = !0
				},
				dragStarted: function(e) {
					var t = this,
						n = e.sortable;
					if (this.isMultiDrag) {
						if (this.options.sort && (n.captureAnimationState(), this.options.animation)) {
							at.forEach(function(e) {
								e !== it && X(e, "position", "absolute")
							});
							var i = Y(it, !1, !0, !0);
							at.forEach(function(e) {
								e !== it && x(e, i)
							}), lt = ct = !0
						}
						n.animateAll(function() {
							lt = ct = !1, t.options.animation && at.forEach(function(e) {
								E(e)
							}), t.options.sort && ft()
						})
					}
				},
				dragOver: function(e) {
					var t = e.target,
						n = e.completed,
						i = e.cancel;
					ct && ~at.indexOf(t) && (n(!1), i())
				},
				revert: function(e) {
					var i, o, t = e.fromSortable,
						n = e.rootEl,
						r = e.sortable,
						a = e.dragRect;
					1 < at.length && (at.forEach(function(e) {
						r.addAnimationState({
							target: e,
							rect: ct ? Y(e) : a
						}), E(e), e.fromRect = a, t.removeAnimationState(e)
					}), ct = !1, i = !this.options.removeCloneOnHide, o = n, at.forEach(function(e, t) {
						var n = o.children[e.sortableIndex + (i ? Number(t) : 0)];
						n ? o.insertBefore(e, n) : o.appendChild(e)
					}))
				},
				dragOverCompleted: function(e) {
					var t = e.sortable,
						n = e.isOwner,
						i = e.insertion,
						o = e.activeSortable,
						r = e.parentEl,
						a = e.putSortable,
						s = this.options;
					if (i) {
						if (n && o._hideClone(), lt = !1, s.animation && 1 < at.length && (ct || !n && !o.options.sort && !a)) {
							var l = Y(it, !1, !0, !0);
							at.forEach(function(e) {
								e !== it && (x(e, l), r.appendChild(e))
							}), ct = !0
						}
						if (!n)
							if (ct || ft(), 1 < at.length) {
								var c = rt;
								o._showClone(t), o.options.animation && !rt && c && st.forEach(function(e) {
									o.addAnimationState({
										target: e,
										rect: ot
									}), e.fromRect = ot, e.thisAnimationDuration = null
								})
							} else o._showClone(t)
					}
				},
				dragOverAnimationCapture: function(e) {
					var t = e.dragRect,
						n = e.isOwner,
						i = e.activeSortable;
					if (at.forEach(function(e) {
							e.thisAnimationDuration = null
						}), i.options.animation && !n && i.multiDrag.isMultiDrag) {
						ot = a({}, t);
						var o = g(it, !0);
						ot.top -= o.f, ot.left -= o.e
					}
				},
				dragOverAnimationComplete: function() {
					ct && (ct = !1, ft())
				},
				drop: function(e) {
					var t = e.originalEvent,
						n = e.rootEl,
						i = e.parentEl,
						o = e.sortable,
						r = e.dispatchSortableEvent,
						a = e.oldIndex,
						s = e.putSortable,
						l = s || this.sortable;
					if (t) {
						var c = this.options,
							u = i.children;
						if (!ut)
							if (c.multiDragKey && !this.multiDragKeyDown && this._deselectMultiDrag(), V(it, c.selectedClass, !~at.indexOf(it)), ~at.indexOf(it)) at.splice(at.indexOf(it), 1), tt = null, A({
								sortable: o,
								rootEl: n,
								name: "deselect",
								targetEl: it,
								originalEvt: t
							});
							else {
								if (at.push(it), A({
										sortable: o,
										rootEl: n,
										name: "select",
										targetEl: it,
										originalEvt: t
									}), t.shiftKey && tt && o.el.contains(tt)) {
									var d, f, h = G(tt),
										p = G(it);
									if (~h && ~p && h !== p)
										for (d = h < p ? (f = h, p) : (f = p, h + 1); f < d; f++) ~at.indexOf(u[f]) || (V(u[f], c.selectedClass, !0), at.push(u[f]), A({
											sortable: o,
											rootEl: n,
											name: "select",
											targetEl: u[f],
											originalEvt: t
										}))
								} else tt = it;
								nt = l
							}
						if (ut && this.isMultiDrag) {
							if ((i[Z].options.sort || i !== n) && 1 < at.length) {
								var m = Y(it),
									g = G(it, ":not(." + this.options.selectedClass + ")");
								if (!lt && c.animation && (it.thisAnimationDuration = null), l.captureAnimationState(), !lt && (c.animation && (it.fromRect = m, at.forEach(function(e) {
										if (e.thisAnimationDuration = null, e !== it) {
											var t = ct ? Y(e) : m;
											e.fromRect = t, l.addAnimationState({
												target: e,
												rect: t
											})
										}
									})), ft(), at.forEach(function(e) {
										u[g] ? i.insertBefore(e, u[g]) : i.appendChild(e), g++
									}), a === G(it))) {
									var v = !1;
									at.forEach(function(e) {
										e.sortableIndex === G(e) || (v = !0)
									}), v && r("update")
								}
								at.forEach(function(e) {
									E(e)
								}), l.animateAll()
							}
							nt = l
						}(n === i || s && "clone" !== s.lastPutMode) && st.forEach(function(e) {
							e.parentNode && e.parentNode.removeChild(e)
						})
					}
				},
				nullingGlobal: function() {
					this.isMultiDrag = ut = !1, st.length = 0
				},
				destroyGlobal: function() {
					this._deselectMultiDrag(), r(document, "pointerup", this._deselectMultiDrag), r(document, "mouseup", this._deselectMultiDrag), r(document, "touchend", this._deselectMultiDrag), r(document, "keydown", this._checkKeyDown), r(document, "keyup", this._checkKeyUp)
				},
				_deselectMultiDrag: function(e) {
					if (!(void 0 !== ut && ut || nt !== this.sortable || e && K(e.target, this.options.draggable, this.sortable.el, !1) || e && 0 !== e.button))
						for (; at.length;) {
							var t = at[0];
							V(t, this.options.selectedClass, !1), at.shift(), A({
								sortable: this.sortable,
								rootEl: this.sortable.el,
								name: "deselect",
								targetEl: t,
								originalEvt: e
							})
						}
				},
				_checkKeyDown: function(e) {
					e.key === this.options.multiDragKey && (this.multiDragKeyDown = !0)
				},
				_checkKeyUp: function(e) {
					e.key === this.options.multiDragKey && (this.multiDragKeyDown = !1)
				}
			}, a(e, {
				pluginName: "multiDrag",
				utils: {
					select: function(e) {
						var t = e.parentNode[Z];
						t && t.options.multiDrag && !~at.indexOf(e) && (nt && nt !== t && (nt.multiDrag._deselectMultiDrag(), nt = t), V(e, t.options.selectedClass, !0), at.push(e))
					},
					deselect: function(e) {
						var t = e.parentNode[Z],
							n = at.indexOf(e);
						t && t.options.multiDrag && ~n && (V(e, t.options.selectedClass, !1), at.splice(n, 1))
					}
				},
				eventProperties: function() {
					var e, n = this,
						i = [],
						o = [];
					return at.forEach(function(e) {
						var t;
						i.push({
							multiDragElement: e,
							index: e.sortableIndex
						}), t = ct && e !== it ? -1 : ct ? G(e, ":not(." + n.options.selectedClass + ")") : G(e), o.push({
							multiDragElement: e,
							index: t
						})
					}), {
						items: function(e) {
							if (Array.isArray(e)) {
								for (var t = 0, n = new Array(e.length); t < e.length; t++) n[t] = e[t];
								return n
							}
						}(e = at) || function(e) {
							if (Symbol.iterator in Object(e) || "[object Arguments]" === Object.prototype.toString.call(e)) return Array.from(e)
						}(e) || function() {
							throw new TypeError("Invalid attempt to spread non-iterable instance")
						}(),
						clones: [].concat(st),
						oldIndicies: i,
						newIndicies: o
					}
				},
				optionListeners: {
					multiDragKey: function(e) {
						return "ctrl" === (e = e.toLowerCase()) ? e = "Control" : 1 < e.length && (e = e.charAt(0).toUpperCase() + e.substr(1)), e
					}
				}
			})
		}), $e
	}),
	function($) {
		"use strict";

		function n(e) {
			var t = e.data;
			e.isDefaultPrevented() || (e.preventDefault(), $(this).ajaxSubmit(t))
		}

		function i(e) {
			var t = e.target,
				n = $(t);
			if (!n.is("[type=submit],[type=image]")) {
				var i = n.closest("[type=submit]");
				if (0 === i.length) return;
				t = i[0]
			}
			var o = this;
			if ("image" == (o.clk = t).type)
				if (void 0 !== e.offsetX) o.clk_x = e.offsetX, o.clk_y = e.offsetY;
				else if ("function" == typeof $.fn.offset) {
				var r = n.offset();
				o.clk_x = e.pageX - r.left, o.clk_y = e.pageY - r.top
			} else o.clk_x = e.pageX - t.offsetLeft, o.clk_y = e.pageY - t.offsetTop;
			setTimeout(function() {
				o.clk = o.clk_x = o.clk_y = null
			}, 100)
		}

		function j() {
			if ($.fn.ajaxSubmit.debug) {
				var e = "[jquery.form] " + Array.prototype.join.call(arguments, "");
				window.console && window.console.log ? window.console.log(e) : window.opera && window.opera.postError && window.opera.postError(e)
			}
		}
		var b = {};
		b.fileapi = void 0 !== $("<input type='file'/>").get(0).files, b.formdata = void 0 !== window.FormData;
		var P = !!$.fn.prop;
		$.fn.attr2 = function() {
			if (!P) return this.attr.apply(this, arguments);
			var e = this.prop.apply(this, arguments);
			return e && e.jquery || "string" == typeof e ? e : this.attr.apply(this, arguments)
		}, $.fn.ajaxSubmit = function(k) {
			function e(e) {
				function u(t) {
					var n = null;
					try {
						t.contentWindow && (n = t.contentWindow.document)
					} catch (e) {
						j("cannot get iframe.contentWindow document: " + e)
					}
					if (n) return n;
					try {
						n = t.contentDocument ? t.contentDocument : t.document
					} catch (e) {
						j("cannot get iframe.contentDocument: " + e), n = t.document
					}
					return n
				}

				function t() {
					var e = I.attr2("target"),
						t = I.attr2("action");
					s.setAttribute("target", o), N || s.setAttribute("method", "POST"), t != f.url && s.setAttribute("action", f.url), f.skipEncodingOverride || N && !/post/i.test(N) || I.attr({
						encoding: "multipart/form-data",
						enctype: "multipart/form-data"
					}), f.timeout && (y = setTimeout(function() {
						v = !0, d(w)
					}, f.timeout));
					var n = [];
					try {
						if (f.extraData)
							for (var i in f.extraData) f.extraData.hasOwnProperty(i) && ($.isPlainObject(f.extraData[i]) && f.extraData[i].hasOwnProperty("name") && f.extraData[i].hasOwnProperty("value") ? n.push($('<input type="hidden" name="' + f.extraData[i].name + '">').val(f.extraData[i].value).appendTo(s)[0]) : n.push($('<input type="hidden" name="' + i + '">').val(f.extraData[i]).appendTo(s)[0]));
						f.iframeTarget || (p.appendTo("body"), m.attachEvent ? m.attachEvent("onload", d) : m.addEventListener("load", d, !1)), setTimeout(function e() {
							try {
								var t = u(m).readyState;
								j("state = " + t), t && "uninitialized" == t.toLowerCase() && setTimeout(e, 50)
							} catch (e) {
								j("Server abort: ", e, " (", e.name, ")"), d(_), y && clearTimeout(y), y = void 0
							}
						}, 15);
						try {
							s.submit()
						} catch (e) {
							document.createElement("form").submit.apply(s)
						}
					} finally {
						s.setAttribute("action", t), e ? s.setAttribute("target", e) : I.removeAttr("target"), $(n).remove()
					}
				}

				function d(e) {
					if (!g.aborted && !C) {
						if ((E = u(m)) || (j("cannot access response document"), e = _), e === w && g) return g.abort("timeout"), void b.reject(g, "timeout");
						if (e == _ && g) return g.abort("server abort"), void b.reject(g, "error", "server abort");
						if (E && E.location.href != f.iframeSrc || v) {
							m.detachEvent ? m.detachEvent("onload", d) : m.removeEventListener("load", d, !1);
							var t, n = "success";
							try {
								if (v) throw "timeout";
								var i = "xml" == f.dataType || E.XMLDocument || $.isXMLDoc(E);
								if (j("isXml=" + i), !i && window.opera && (null === E.body || !E.body.innerHTML) && --T) return j("requeing onLoad callback, DOM not available"), void setTimeout(d, 250);
								var o = E.body ? E.body : E.documentElement;
								g.responseText = o ? o.innerHTML : null, g.responseXML = E.XMLDocument ? E.XMLDocument : E, i && (f.dataType = "xml"), g.getResponseHeader = function(e) {
									return {
										"content-type": f.dataType
									}[e]
								}, o && (g.status = Number(o.getAttribute("status")) || g.status, g.statusText = o.getAttribute("statusText") || g.statusText);
								var r = (f.dataType || "").toLowerCase(),
									a = /(json|script|text)/.test(r);
								if (a || f.textarea) {
									var s = E.getElementsByTagName("textarea")[0];
									if (s) g.responseText = s.value, g.status = Number(s.getAttribute("status")) || g.status, g.statusText = s.getAttribute("statusText") || g.statusText;
									else if (a) {
										var l = E.getElementsByTagName("pre")[0],
											c = E.getElementsByTagName("body")[0];
										l ? g.responseText = l.textContent ? l.textContent : l.innerText : c && (g.responseText = c.textContent ? c.textContent : c.innerText)
									}
								} else "xml" == r && !g.responseXML && g.responseText && (g.responseXML = S(g.responseText));
								try {
									x = A(g, r, f)
								} catch (e) {
									n = "parsererror", g.error = t = e || n
								}
							} catch (e) {
								j("error caught: ", e), n = "error", g.error = t = e || n
							}
							g.aborted && (j("upload aborted"), n = null), g.status && (n = 200 <= g.status && g.status < 300 || 304 === g.status ? "success" : "error"), "success" === n ? (f.success && f.success.call(f.context, x, "success", g), b.resolve(g.responseText, "success", g), h && $.event.trigger("ajaxSuccess", [g, f])) : n && (void 0 === t && (t = g.statusText), f.error && f.error.call(f.context, g, n, t), b.reject(g, "error", t), h && $.event.trigger("ajaxError", [g, f, t])), h && $.event.trigger("ajaxComplete", [g, f]), h && !--$.active && $.event.trigger("ajaxStop"), f.complete && f.complete.call(f.context, g, n), C = !0, f.timeout && clearTimeout(y), setTimeout(function() {
								f.iframeTarget || p.remove(), g.responseXML = null
							}, 100)
						}
					}
				}
				var n, i, f, h, o, p, m, g, r, a, v, y, s = I[0],
					b = $.Deferred();
				if (e)
					for (i = 0; O.length > i; i++) n = $(O[i]), P ? n.prop("disabled", !1) : n.removeAttr("disabled");
				if ((f = $.extend(!0, {}, $.ajaxSettings, k)).context = f.context || f, o = "jqFormIO" + (new Date).getTime(), f.iframeTarget ? (a = (p = $(f.iframeTarget)).attr2("name")) ? o = a : p.attr2("name", o) : (p = $('<iframe name="' + o + '" src="' + f.iframeSrc + '" />')).css({
						position: "absolute",
						top: "-1000px",
						left: "-1000px"
					}), m = p[0], g = {
						aborted: 0,
						responseText: null,
						responseXML: null,
						status: 0,
						statusText: "n/a",
						getAllResponseHeaders: function() {},
						getResponseHeader: function() {},
						setRequestHeader: function() {},
						abort: function(e) {
							var t = "timeout" === e ? "timeout" : "aborted";
							j("aborting upload... " + t), this.aborted = 1;
							try {
								m.contentWindow.document.execCommand && m.contentWindow.document.execCommand("Stop")
							} catch (e) {}
							p.attr("src", f.iframeSrc), g.error = t, f.error && f.error.call(f.context, g, t, e), h && $.event.trigger("ajaxError", [g, f, t]), f.complete && f.complete.call(f.context, g, t)
						}
					}, (h = f.global) && 0 == $.active++ && $.event.trigger("ajaxStart"), h && $.event.trigger("ajaxSend", [g, f]), f.beforeSend && !1 === f.beforeSend.call(f.context, g, f)) return f.global && $.active--, b.reject(), b;
				if (g.aborted) return b.reject(), b;
				!(r = s.clk) || (a = r.name) && !r.disabled && (f.extraData = f.extraData || {}, f.extraData[a] = r.value, "image" == r.type && (f.extraData[a + ".x"] = s.clk_x, f.extraData[a + ".y"] = s.clk_y));
				var w = 1,
					_ = 2,
					l = $("meta[name=csrf-token]").attr("content"),
					c = $("meta[name=csrf-param]").attr("content");
				c && l && (f.extraData = f.extraData || {}, f.extraData[c] = l), f.forceSync ? t() : setTimeout(t, 10);
				var x, E, C, T = 50,
					S = $.parseXML || function(e, t) {
						return window.ActiveXObject ? ((t = new ActiveXObject("Microsoft.XMLDOM")).async = "false", t.loadXML(e)) : t = (new DOMParser).parseFromString(e, "text/xml"), t && t.documentElement && "parsererror" != t.documentElement.nodeName ? t : null
					},
					D = $.parseJSON || function(e) {
						return window.eval("(" + e + ")")
					},
					A = function(e, t, n) {
						var i = e.getResponseHeader("content-type") || "",
							o = "xml" === t || !t && 0 <= i.indexOf("xml"),
							r = o ? e.responseXML : e.responseText;
						return o && "parsererror" === r.documentElement.nodeName && $.error && $.error("parsererror"), n && n.dataFilter && (r = n.dataFilter(r, t)), "string" == typeof r && ("json" === t || !t && 0 <= i.indexOf("json") ? r = D(r) : ("script" === t || !t && 0 <= i.indexOf("javascript")) && $.globalEval(r)), r
					};
				return b
			}
			if (!this.length) return j("ajaxSubmit: skipping submit process - no element selected"), this;
			var N, t, n, I = this;
			"function" == typeof k ? k = {
				success: k
			} : void 0 === k && (k = {}), N = k.type || this.attr2("method"), n = (n = (n = "string" == typeof(t = k.url || this.attr2("action")) ? $.trim(t) : "") || window.location.href || "") && (n.match(/^([^#]+)/) || [])[1], k = $.extend(!0, {
				url: n,
				success: $.ajaxSettings.success,
				type: N || "GET",
				iframeSrc: /^https/i.test(window.location.href || "") ? "javascript:false" : "about:blank"
			}, k);
			var i = {};
			if (this.trigger("form-pre-serialize", [this, k, i]), i.veto) return j("ajaxSubmit: submit vetoed via form-pre-serialize trigger"), this;
			if (k.beforeSerialize && !1 === k.beforeSerialize(this, k)) return j("ajaxSubmit: submit aborted via beforeSerialize callback"), this;
			var o = k.traditional;
			void 0 === o && (o = $.ajaxSettings.traditional);
			var r, O = [],
				a = this.formToArray(k.semantic, O);
			if (k.data && (k.extraData = k.data, r = $.param(k.data, o)), k.beforeSubmit && !1 === k.beforeSubmit(a, this, k)) return j("ajaxSubmit: submit aborted via beforeSubmit callback"), this;
			if (this.trigger("form-submit-validate", [a, this, k, i]), i.veto) return j("ajaxSubmit: submit vetoed via form-submit-validate trigger"), this;
			var s = $.param(a, o);
			r && (s = s ? s + "&" + r : r), "GET" == k.type.toUpperCase() ? (k.url += (0 <= k.url.indexOf("?") ? "&" : "?") + s, k.data = null) : k.data = s;
			var l = [];
			if (k.resetForm && l.push(function() {
					I.resetForm()
				}), k.clearForm && l.push(function() {
					I.clearForm(k.includeHidden)
				}), !k.dataType && k.target) {
				var c = k.success || function() {};
				l.push(function(e) {
					var t = k.replaceTarget ? "replaceWith" : "html";
					$(k.target)[t](e).each(c, arguments)
				})
			} else k.success && l.push(k.success);
			if (k.success = function(e, t, n) {
					for (var i = k.context || this, o = 0, r = l.length; o < r; o++) l[o].apply(i, [e, t, n || I, I])
				}, k.error) {
				var u = k.error;
				k.error = function(e, t, n) {
					var i = k.context || this;
					u.apply(i, [e, t, n, I])
				}
			}
			if (k.complete) {
				var d = k.complete;
				k.complete = function(e, t) {
					var n = k.context || this;
					d.apply(n, [e, t, I])
				}
			}
			var f = 0 < $('input[type=file]:enabled[value!=""]', this).length,
				h = "multipart/form-data",
				p = I.attr("enctype") == h || I.attr("encoding") == h,
				m = b.fileapi && b.formdata;
			j("fileAPI :" + m);
			var g, v = (f || p) && !m;
			!1 !== k.iframe && (k.iframe || v) ? k.closeKeepAlive ? $.get(k.closeKeepAlive, function() {
				g = e(a)
			}) : g = e(a) : g = (f || p) && m ? function(e) {
				for (var n = new FormData, t = 0; e.length > t; t++) n.append(e[t].name, e[t].value);
				if (k.extraData) {
					var i = function(e) {
						var t, n, i = $.param(e, k.traditional).split("&"),
							o = i.length,
							r = [];
						for (t = 0; t < o; t++) i[t] = i[t].replace(/\+/g, " "), n = i[t].split("="), r.push([decodeURIComponent(n[0]), decodeURIComponent(n[1])]);
						return r
					}(k.extraData);
					for (t = 0; i.length > t; t++) i[t] && n.append(i[t][0], i[t][1])
				}
				k.data = null;
				var o = $.extend(!0, {}, $.ajaxSettings, k, {
					contentType: !1,
					processData: !1,
					cache: !1,
					type: N || "POST"
				});
				k.uploadProgress && (o.xhr = function() {
					var e = $.ajaxSettings.xhr();
					return e.upload && e.upload.addEventListener("progress", function(e) {
						var t = 0,
							n = e.loaded || e.position,
							i = e.total;
						e.lengthComputable && (t = Math.ceil(n / i * 100)), k.uploadProgress(e, n, i, t)
					}, !1), e
				}), o.data = null;
				var r = o.beforeSend;
				return o.beforeSend = function(e, t) {
					t.data = n, r && r.call(this, e, t)
				}, $.ajax(o)
			}(a) : $.ajax(k), I.removeData("jqxhr").data("jqxhr", g);
			for (var y = 0; O.length > y; y++) O[y] = null;
			return this.trigger("form-submit-notify", [this, k]), this
		}, $.fn.ajaxForm = function(e) {
			if ((e = e || {}).delegation = e.delegation && $.isFunction($.fn.on), e.delegation || 0 !== this.length) return e.delegation ? ($(document).off("submit.form-plugin", this.selector, n).off("click.form-plugin", this.selector, i).on("submit.form-plugin", this.selector, e, n).on("click.form-plugin", this.selector, e, i), this) : this.ajaxFormUnbind().bind("submit.form-plugin", e, n).bind("click.form-plugin", e, i);
			var t = {
				s: this.selector,
				c: this.context
			};
			return !$.isReady && t.s ? (j("DOM not ready, queuing ajaxForm"), $(function() {
				$(t.s, t.c).ajaxForm(e)
			})) : j("terminating; zero elements found by selector" + ($.isReady ? "" : " (DOM not ready)")), this
		}, $.fn.ajaxFormUnbind = function() {
			return this.unbind("submit.form-plugin click.form-plugin")
		}, $.fn.formToArray = function(e, t) {
			var n = [];
			if (0 === this.length) return n;
			var i, o, r, a, s, l, c, u = this[0],
				d = e ? u.getElementsByTagName("*") : u.elements;
			if (!d) return n;
			for (i = 0, l = d.length; i < l; i++)
				if ((r = (s = d[i]).name) && !s.disabled)
					if (e && u.clk && "image" == s.type) u.clk == s && (n.push({
						name: r,
						value: $(s).val(),
						type: s.type
					}), n.push({
						name: r + ".x",
						value: u.clk_x
					}, {
						name: r + ".y",
						value: u.clk_y
					}));
					else if ((a = $.fieldValue(s, !0)) && a.constructor == Array)
				for (t && t.push(s), o = 0, c = a.length; o < c; o++) n.push({
					name: r,
					value: a[o]
				});
			else if (b.fileapi && "file" == s.type) {
				t && t.push(s);
				var f = s.files;
				if (f.length)
					for (o = 0; f.length > o; o++) n.push({
						name: r,
						value: f[o],
						type: s.type
					});
				else n.push({
					name: r,
					value: "",
					type: s.type
				})
			} else null != a && (t && t.push(s), n.push({
				name: r,
				value: a,
				type: s.type,
				required: s.required
			}));
			if (!e && u.clk) {
				var h = $(u.clk),
					p = h[0];
				(r = p.name) && !p.disabled && "image" == p.type && (n.push({
					name: r,
					value: h.val()
				}), n.push({
					name: r + ".x",
					value: u.clk_x
				}, {
					name: r + ".y",
					value: u.clk_y
				}))
			}
			return n
		}, $.fn.formSerialize = function(e) {
			return $.param(this.formToArray(e))
		}, $.fn.fieldSerialize = function(o) {
			var r = [];
			return this.each(function() {
				var e = this.name;
				if (e) {
					var t = $.fieldValue(this, o);
					if (t && t.constructor == Array)
						for (var n = 0, i = t.length; n < i; n++) r.push({
							name: e,
							value: t[n]
						});
					else null != t && r.push({
						name: this.name,
						value: t
					})
				}
			}), $.param(r)
		}, $.fn.fieldValue = function(e) {
			for (var t = [], n = 0, i = this.length; n < i; n++) {
				var o = this[n],
					r = $.fieldValue(o, e);
				null == r || r.constructor == Array && !r.length || (r.constructor == Array ? $.merge(t, r) : t.push(r))
			}
			return t
		}, $.fieldValue = function(e, t) {
			var n = e.name,
				i = e.type,
				o = e.tagName.toLowerCase();
			if (void 0 === t && (t = !0), t && (!n || e.disabled || "reset" == i || "button" == i || ("checkbox" == i || "radio" == i) && !e.checked || ("submit" == i || "image" == i) && e.form && e.form.clk != e || "select" == o && -1 == e.selectedIndex)) return null;
			if ("select" != o) return $(e).val();
			var r = e.selectedIndex;
			if (r < 0) return null;
			for (var a = [], s = e.options, l = "select-one" == i, c = l ? r + 1 : s.length, u = l ? r : 0; u < c; u++) {
				var d = s[u];
				if (d.selected) {
					var f = d.value;
					if (f = f || (d.attributes && d.attributes.value && !d.attributes.value.specified ? d.text : d.value), l) return f;
					a.push(f)
				}
			}
			return a
		}, $.fn.clearForm = function(e) {
			return this.each(function() {
				$("input,select,textarea", this).clearFields(e)
			})
		}, $.fn.clearFields = $.fn.clearInputs = function(n) {
			var i = /^(?:color|date|datetime|email|month|number|password|range|search|tel|text|time|url|week)$/i;
			return this.each(function() {
				var e = this.type,
					t = this.tagName.toLowerCase();
				i.test(e) || "textarea" == t ? this.value = "" : "checkbox" == e || "radio" == e ? this.checked = !1 : "select" == t ? this.selectedIndex = -1 : "file" == e ? /MSIE/.test(navigator.userAgent) ? $(this).replaceWith($(this).clone(!0)) : $(this).val("") : n && (!0 === n && /hidden/.test(e) || "string" == typeof n && $(this).is(n)) && (this.value = "")
			})
		}, $.fn.resetForm = function() {
			return this.each(function() {
				"function" != typeof this.reset && ("object" != typeof this.reset || this.reset.nodeType) || this.reset()
			})
		}, $.fn.enable = function(e) {
			return void 0 === e && (e = !0), this.each(function() {
				this.disabled = !e
			})
		}, $.fn.selected = function(n) {
			return void 0 === n && (n = !0), this.each(function() {
				var e = this.type;
				if ("checkbox" == e || "radio" == e) this.checked = n;
				else if ("option" == this.tagName.toLowerCase()) {
					var t = $(this).parent("select");
					n && t[0] && "select-one" == t[0].type && t.find("option").selected(!1), this.selected = n
				}
			})
		}, $.fn.ajaxSubmit.debug = !1
	}(jQuery),
	function(g) {
		"use strict";

		function a(e, t) {
			this.itemsArray = [], this.$element = g(e), this.$element.hide(), this.isSelect = "SELECT" === e.tagName, this.multiple = this.isSelect && e.hasAttribute("multiple"), this.objectItems = t && t.itemValue, this.placeholderText = e.hasAttribute("placeholder") ? this.$element.attr("placeholder") : "", this.inputSize = Math.max(1, this.placeholderText.length), this.$container = g('<div class="bootstrap-tagsinput"></div>'), this.$input = g('<input type="text" placeholder="' + this.placeholderText + '"/>').appendTo(this.$container), this.$element.before(this.$container), this.build(t)
		}

		function r(e, t) {
			if ("function" != typeof e[t]) {
				var n = e[t];
				e[t] = function(e) {
					return e[n]
				}
			}
		}

		function s(e, t) {
			if ("function" != typeof e[t]) {
				var n = e[t];
				e[t] = function() {
					return n
				}
			}
		}

		function v(e) {
			return e ? t.text(e).html() : ""
		}

		function c(e) {
			var t = 0;
			if (document.selection) {
				e.focus();
				var n = document.selection.createRange();
				n.moveStart("character", -e.value.length), t = n.text.length
			} else !e.selectionStart && "0" != e.selectionStart || (t = e.selectionStart);
			return t
		}
		var u = {
			tagClass: function(e) {
				return "label label-info"
			},
			itemValue: function(e) {
				return e ? e.toString() : e
			},
			itemText: function(e) {
				return this.itemValue(e)
			},
			itemTitle: function(e) {
				return null
			},
			freeInput: !0,
			addOnBlur: !0,
			maxTags: void 0,
			maxChars: void 0,
			confirmKeys: [13, 44],
			delimiter: ",",
			delimiterRegex: null,
			cancelConfirmKeysOnEmpty: !0,
			onTagExists: function(e, t) {
				t.hide().fadeIn()
			},
			trimValue: !1,
			allowDuplicates: !1
		};
		a.prototype = {
			constructor: a,
			add: function(e, t, n) {
				var i = this;
				if (!(i.options.maxTags && i.itemsArray.length >= i.options.maxTags) && (!1 === e || e)) {
					if ("string" == typeof e && i.options.trimValue && (e = g.trim(e)), "object" == typeof e && !i.objectItems) throw "Can't add objects when itemValue option is not set";
					if (!e.toString().match(/^\s*$/)) {
						if (i.isSelect && !i.multiple && 0 < i.itemsArray.length && i.remove(i.itemsArray[0]), "string" == typeof e && "INPUT" === this.$element[0].tagName) {
							var o = i.options.delimiterRegex ? i.options.delimiterRegex : i.options.delimiter,
								r = e.split(o);
							if (1 < r.length) {
								for (var a = 0; a < r.length; a++) this.add(r[a], !0);
								return void(t || i.pushVal())
							}
						}
						var s = i.options.itemValue(e),
							l = i.options.itemText(e),
							c = i.options.tagClass(e),
							u = i.options.itemTitle(e),
							d = g.grep(i.itemsArray, function(e) {
								return i.options.itemValue(e) === s
							})[0];
						if (!d || i.options.allowDuplicates) {
							if (!(i.items().toString().length + e.length + 1 > i.options.maxInputLength)) {
								var f = g.Event("beforeItemAdd", {
									item: e,
									cancel: !1,
									options: n
								});
								if (i.$element.trigger(f), !f.cancel) {
									i.itemsArray.push(e);
									var h = g('<span class="tag ' + v(c) + (null !== u ? '" title="' + u : "") + '">' + v(l) + '<span data-role="remove"></span></span>');
									if (h.data("item", e), i.findInputWrapper().before(h), h.after(" "), i.isSelect && !g('option[value="' + encodeURIComponent(s) + '"]', i.$element)[0]) {
										var p = g("<option selected>" + v(l) + "</option>");
										p.data("item", e), p.attr("value", s), i.$element.append(p)
									}
									t || i.pushVal(), i.options.maxTags !== i.itemsArray.length && i.items().toString().length !== i.options.maxInputLength || i.$container.addClass("bootstrap-tagsinput-max"), i.$element.trigger(g.Event("itemAdded", {
										item: e,
										options: n
									}))
								}
							}
						} else if (i.options.onTagExists) {
							var m = g(".tag", i.$container).filter(function() {
								return g(this).data("item") === d
							});
							i.options.onTagExists(e, m)
						}
					}
				}
			},
			remove: function(t, e, n) {
				var i = this;
				if (i.objectItems && (t = (t = "object" == typeof t ? g.grep(i.itemsArray, function(e) {
						return i.options.itemValue(e) == i.options.itemValue(t)
					}) : g.grep(i.itemsArray, function(e) {
						return i.options.itemValue(e) == t
					}))[t.length - 1]), t) {
					var o = g.Event("beforeItemRemove", {
						item: t,
						cancel: !1,
						options: n
					});
					if (i.$element.trigger(o), o.cancel) return;
					g(".tag", i.$container).filter(function() {
						return g(this).data("item") === t
					}).remove(), g("option", i.$element).filter(function() {
						return g(this).data("item") === t
					}).remove(), -1 !== g.inArray(t, i.itemsArray) && i.itemsArray.splice(g.inArray(t, i.itemsArray), 1)
				}
				e || i.pushVal(), i.options.maxTags > i.itemsArray.length && i.$container.removeClass("bootstrap-tagsinput-max"), i.$element.trigger(g.Event("itemRemoved", {
					item: t,
					options: n
				}))
			},
			removeAll: function() {
				for (g(".tag", this.$container).remove(), g("option", this.$element).remove(); 0 < this.itemsArray.length;) this.itemsArray.pop();
				this.pushVal()
			},
			refresh: function() {
				var r = this;
				g(".tag", r.$container).each(function() {
					var e = g(this),
						t = e.data("item"),
						n = r.options.itemValue(t),
						i = r.options.itemText(t),
						o = r.options.tagClass(t);
					e.attr("class", null), e.addClass("tag " + v(o)), e.contents().filter(function() {
						return 3 == this.nodeType
					})[0].nodeValue = v(i), r.isSelect && g("option", r.$element).filter(function() {
						return g(this).data("item") === t
					}).attr("value", n)
				})
			},
			items: function() {
				return this.itemsArray
			},
			pushVal: function() {
				var t = this,
					e = g.map(t.items(), function(e) {
						return t.options.itemValue(e).toString()
					});
				t.$element.val(e, !0).trigger("change")
			},
			build: function(e) {
				var l = this;
				if (l.options = g.extend({}, u, e), l.objectItems && (l.options.freeInput = !1), r(l.options, "itemValue"), r(l.options, "itemText"), s(l.options, "tagClass"), l.options.typeahead) {
					var i = l.options.typeahead || {};
					s(i, "source"), l.$input.typeahead(g.extend({}, i, {
						source: function(e, o) {
							function t(e) {
								for (var t = [], n = 0; n < e.length; n++) {
									var i = l.options.itemText(e[n]);
									r[i] = e[n], t.push(i)
								}
								o(t)
							}
							this.map = {};
							var r = this.map,
								n = i.source(e);
							g.isFunction(n.success) ? n.success(t) : g.isFunction(n.then) ? n.then(t) : g.when(n).then(t)
						},
						updater: function(e) {
							return l.add(this.map[e]), this.map[e]
						},
						matcher: function(e) {
							return -1 !== e.toLowerCase().indexOf(this.query.trim().toLowerCase())
						},
						sorter: function(e) {
							return e.sort()
						},
						highlighter: function(e) {
							var t = new RegExp("(" + this.query + ")", "gi");
							return e.replace(t, "<strong>$1</strong>")
						}
					}))
				}
				if (l.options.typeaheadjs) {
					var t = null,
						n = {},
						o = l.options.typeaheadjs;
					n = g.isArray(o) ? (t = o[0], o[1]) : o, l.$input.typeahead(t, n).on("typeahead:selected", g.proxy(function(e, t) {
						n.valueKey ? l.add(t[n.valueKey]) : l.add(t), l.$input.typeahead("val", "")
					}, l))
				}
				l.$container.on("click", g.proxy(function(e) {
					l.$element.attr("disabled") || l.$input.removeAttr("disabled"), l.$input.focus()
				}, l)), l.options.addOnBlur && l.options.freeInput && l.$input.on("focusout", g.proxy(function(e) {
					0 === g(".typeahead, .twitter-typeahead", l.$container).length && (l.add(l.$input.val()), l.$input.val(""))
				}, l)), l.$container.on("keydown", "input", g.proxy(function(e) {
					var t = g(e.target),
						n = l.findInputWrapper();
					if (l.$element.attr("disabled")) l.$input.attr("disabled", "disabled");
					else {
						switch (e.which) {
							case 8:
								if (0 === c(t[0])) {
									var i = n.prev();
									i.length && l.remove(i.data("item"))
								}
								break;
							case 46:
								if (0 === c(t[0])) {
									var o = n.next();
									o.length && l.remove(o.data("item"))
								}
								break;
							case 37:
								var r = n.prev();
								0 === t.val().length && r[0] && (r.before(n), t.focus());
								break;
							case 39:
								var a = n.next();
								0 === t.val().length && a[0] && (a.after(n), t.focus())
						}
						var s = t.val().length;
						Math.ceil(s / 5), t.attr("size", Math.max(this.inputSize, t.val().length))
					}
				}, l)), l.$container.on("keypress", "input", g.proxy(function(e) {
					var t = g(e.target);
					if (l.$element.attr("disabled")) l.$input.attr("disabled", "disabled");
					else {
						var r, n, a, i = t.val(),
							o = l.options.maxChars && i.length >= l.options.maxChars;
						l.options.freeInput && (r = e, n = l.options.confirmKeys, a = !1, g.each(n, function(e, t) {
							if ("number" == typeof t && r.which === t) return !(a = !0);
							if (r.which === t.which) {
								var n = !t.hasOwnProperty("altKey") || r.altKey === t.altKey,
									i = !t.hasOwnProperty("shiftKey") || r.shiftKey === t.shiftKey,
									o = !t.hasOwnProperty("ctrlKey") || r.ctrlKey === t.ctrlKey;
								if (n && i && o) return !(a = !0)
							}
						}), a || o) && (0 !== i.length && (l.add(o ? i.substr(0, l.options.maxChars) : i), t.val("")), !1 === l.options.cancelConfirmKeysOnEmpty && e.preventDefault());
						var s = t.val().length;
						Math.ceil(s / 5), t.attr("size", Math.max(this.inputSize, t.val().length))
					}
				}, l)), l.$container.on("click", "[data-role=remove]", g.proxy(function(e) {
					l.$element.attr("disabled") || l.remove(g(e.target).closest(".tag").data("item"))
				}, l)), l.options.itemValue === u.itemValue && ("INPUT" === l.$element[0].tagName ? l.add(l.$element.val()) : g("option", l.$element).each(function() {
					l.add(g(this).attr("value"), !0)
				}))
			},
			destroy: function() {
				this.$container.off("keypress", "input"), this.$container.off("click", "[role=remove]"), this.$container.remove(), this.$element.removeData("tagsinput"), this.$element.show()
			},
			focus: function() {
				this.$input.focus()
			},
			input: function() {
				return this.$input
			},
			findInputWrapper: function() {
				for (var e = this.$input[0], t = this.$container[0]; e && e.parentNode !== t;) e = e.parentNode;
				return g(e)
			}
		}, g.fn.tagsinput = function(n, i, o) {
			var r = [];
			return this.each(function() {
				var e = g(this).data("tagsinput");
				if (e)
					if (n || i) {
						if (void 0 !== e[n]) {
							if (3 === e[n].length && void 0 !== o) var t = e[n](i, null, o);
							else t = e[n](i);
							void 0 !== t && r.push(t)
						}
					} else r.push(e);
				else e = new a(this, n), g(this).data("tagsinput", e), r.push(e), "SELECT" === this.tagName && g("option", g(this)).attr("selected", "selected"), g(this).val(g(this).val())
			}), "string" == typeof n ? 1 < r.length ? r : r[0] : r
		}, g.fn.tagsinput.Constructor = a;
		var t = g("<div />");
		g(function() {
			g("input[data-role=tagsinput], select[multiple][data-role=tagsinput]").tagsinput()
		})
	}(window.jQuery), $.fn.typer = function(o, r) {
		r = $.extend({}, {
			char: "",
			delay: 4e3,
			duration: 450,
			endless: !0,
			onType: $.noop,
			afterWord: $.noop
		}, r || o), o = $.isPlainObject(o) ? r.text : o;
		var a = $(this),
			s = !1,
			l = 0;
		! function e(t) {
			var n = ({
					string: 1,
					number: 1
				}[typeof o] ? o : o[t]) + "",
				i = n.substr(l++, 1);
			if (r.onType(), "<" === i && (s = !0), ">" === i && (s = !1), a.html(n.substr(0, l) + (r.char || " ")), l <= n.length) s ? e(t) : setTimeout(e, r.duration / 10, t);
			else {
				if (l = 0, ++t === o.length && !r.endless) return;
				t === o.length && (t = 0), r.afterWord()
			}
		}(0)
	}, $(document).ready(function() {
		var e, t, n, i = (t = navigator.userAgent, n = t.match(/(opera|chrome|safari|firefox|msie|trident(?=\/))\/?\s*(\d+)/i) || [], /trident/i.test(n[1]) ? "IE " + ((e = /\brv[ :]+(\d+)/g.exec(t) || [])[1] || "") : "Chrome" === n[1] && null != (e = t.match(/\b(OPR|Edge)\/(\d+)/)) ? e.slice(1).join(" ").replace("OPR", "Opera") : (n = n[2] ? [n[1], n[2]] : [navigator.appName, navigator.appVersion, "-?"], null != (e = t.match(/version\/(\d+)/i)) && n.splice(1, 1, e[1]), n.join(" "))).split(" "),
			o = i[0],
			r = i[1],
			a = ["Opera", "Chrome", "Safari", "Firefox", "IE", "Edge"];
		a.includes(o) ? ["64", "79", "13", "72", "11", "18"][a.indexOf(o)] <= r || $("body").prepend('<div class="alert-browser" style="background-color: #ff7c7c;color: #fff;padding: 15px 20px;position: fixed;text-align: center;width: 100%;z-index: 10;">Oops! Parece que estás usando un navegador obsoleto. Por favor <a href="http://browsehappy.com/?locale=es_ES" style="color: lighten(#ff7c7c, 10%); text-decoration: underline;">actualiza tu navegador</a> para mejorar tu experiencia en la web.</div>') : $("body").prepend('<div class="alert-browser" style="background-color: #ff7c7c;color: #fff;padding: 15px 20px;position: fixed;text-align: center;width: 100%;z-index: 10;">Oops! Parece que estás usando un navegador obsoleto. Por favor <a href="http://browsehappy.com/?locale=es_ES" style="color: lighten(#ff7c7c, 10%); text-decoration: underline;">actualiza tu navegador</a> para mejorar tu experiencia en la web.</div>');
		var s = $(".banners [class^='banner-']").length,
			l = 1;
		$(".flecha-top").hide();
		$(".typer");
		var c = $(".banner-1").attr("data-descripcion");

		function u() {
			var e = $(".menu-nav").height();
			$("#historia").css({
				"margin-top": e
			})
		}

		function d() {
			var e = $(".menu-nav").height();
			$(".banner-lado-izquierdo").css({
				top: e + "px",
				height: "calc( 100vh - " + e + "px)"
			}), $(".banner-lado-derecho").css({
				top: e + "px",
				height: "calc( 100vh - " + e + "px)"
			})
		}

		function f(e) {
			var t = e.attr("order"),
				n = 100 / $('.tabs-registro a[data-toggle="pill"]').length * (t - 1);
			$(".tabs-registro").find(".progress-bar").css({
				width: n + "%"
			}).attr({
				"aria-valuenow": n
			}).empty().html(n + "%")
		}
		$(".slider-mensaje").find("footer").empty().html(c), $("#historia").length && u(), $(document).resize(function() {
				$("#historia").length && u(), d()
			}), $('[data-toggle="tooltip"]').tooltip(), d(), $(document).scroll(function() {
				768 < $(document).scrollTop() ? $(".flecha-top").show() : $(".flecha-top").hide(), d()
			}), $(".flecha-top").on("click", function() {
				$("html, body").animate({
					scrollTop: 0
				}, "slow")
			}), $(".btn-slider-left").on("click", function() {
				p(), $(".banners [class^='banner-']").removeClass("banner-subir"), 1 == l ? l = s : l--, $(".banners [class^='banner-']").removeClass("banner-mostrado animated fadeIn"), $(".banner-" + l).addClass("banner-mostrado animated fadeIn"), $(".banner-dentro").css({
					"background-image": "url(../images/00" + l + ".jpg)"
				});
				var e = $(".banner-" + l).attr("data-descripcion");
				$(".slider-mensaje").find("footer").empty().html(e), $(".slider-pagging [class^='slider-']").removeClass("slider-active"), $(".slider-pagging [class^='slider-']").eq(l - 1).addClass("slider-active"), setTimeout(function() {
					$(".wrap-slider-left").trigger("mouseenter")
				}, 1e3)
			}),
			function() {
				for (var e = "", t = 0; t < s; t++) e += 0 == t ? '<div class="slider-banner slider-active"></div>' : '<div class="slider-banner"></div>';
				$(".slider-pagging").html(e)
			}(), $(".btn-slider-right").on("click", function() {
				p(), $(".banners [class^='banner-']").removeClass("banner-subir"), l == s ? l = 1 : l++, $(".banners [class^='banner-']").removeClass("banner-mostrado animated fadeIn"), $(".banner-" + l).addClass("banner-mostrado animated fadeIn"), $(".banner-dentro").css({
					"background-image": "url(../images/00" + l + ".jpg)"
				});
				var e = $(".banner-" + l).attr("data-descripcion");
				$(".slider-mensaje").find("footer").empty().html(e), $(".slider-pagging [class^='slider-']").removeClass("slider-active"), $(".slider-pagging [class^='slider-']").eq(l - 1).addClass("slider-active"), setTimeout(function() {
					$(".wrap-slider-right").trigger("mouseenter")
				}, 1e3)
			}), $(".wrap-slider-left").on("mouseenter", function() {
				$(".banners [class^='banner-']").removeClass("banner-subir");
				var e = $(".banner-mostrado").attr("class").split(" ")[0].split("-"),
					t = parseInt(e[1]),
					n = 0;
				n = 1 == t ? s : t - 1, $(".banner-" + n).addClass("banner-subir").show();
				for (var i = 1; i <= s; i++) i != t && i != n && $(".banner-" + i).hide()
			}), $(".wrap-slider-right").on("mouseenter", function() {
				$(".banners [class^='banner-']").removeClass("banner-subir");
				var e = $(".banner-mostrado").attr("class").split(" ")[0].split("-"),
					t = parseInt(e[1]),
					n = 0;
				n = t == s ? 1 : t + 1, $(".banner-" + n).addClass("banner-subir").show();
				for (var i = 1; i <= s; i++) i != t && i != n && $(".banner-" + i).hide()
			}), $("#enlaceAspectos").on("click", function() {
				var e = $("#aspectos-generales").offset().top - $(".menu-nav").innerHeight();
				$("html, body").animate({
					scrollTop: e
				}, 3e3)
			}), $("#accordion h3").on("click", function() {
				var e = $(this).attr("href"),
					t = $(".menu-nav").height(),
					n = $(e).parent().parent().offset().top;
				$("html, body").animate({
					scrollTop: n - t - 24
				}, "slow")
			}), f($(".tabs-registro").find("a.active")), $('.tabs-registro a[data-toggle="pill"]').on("shown.bs.tab", function(e) {
				e.target, e.relatedTarget, f($(this))
			}), $(".nav-tab").on("click", function(e) {
				e.preventDefault();
				var t = $(this).attr("dest");
				t <= $('.tabs-registro a[data-toggle="pill"]').length ? $('.tabs-registro a[data-toggle="pill"]').eq(t - 1).trigger("click") : $(".tabs-registro").find(".progress-bar").css({
					width: "100%"
				}).attr({
					"aria-valuenow": 100
				}).empty().html("100%");
				var n = $(".tabs-registro").offset().top - $(".menu-nav").innerHeight();
				$("html, body").animate({
					scrollTop: n
				}, 1e3)
			}), $("#solicitar-revision").on("hidden.bs.modal", function(e) {
				f($(".tabs-registro").find("a.active"))
			});
		var h = 0;

		function p() {
			h = 0
		}

		function m(o) {
		    debugger;
			var e = o.find("tbody").find("th"),
				r = o.parent().attr("data-order");
			console.log(o);
			for (var a = 0; a < e.length; a++) {
				var s = a + 1;
				o.find("tbody").find("th").eq(a).empty().html(s), o.find("tbody").find("tr").eq(a).removeAttr("id").attr({
					id: "detalles-tr-" + s
				}), o.find("tbody").find("tr").eq(a).find("select").each(function(e, t) {
					var n = $(this).attr("id"),
						i = "cbo-det-" + r + "-" + (e + 1) + "-" + s;
					o.find("tbody").find("tr").eq(a).find("#" + n).attr({
						id: i
					})
				}), o.find("tbody").find("tr").eq(a).find("input[type='text']").each(function(e, t) {
					var n = $(this).attr("id"),
						i = "txt-det-" + r + "-" + (e + 1) + "-" + s;
					o.find("tbody").find("tr").eq(a).find("#" + n).attr({
						id: i
					})
				}), o.find("tbody").find("tr").eq(a).find("input[type='date']").each(function(e, t) {
					var n = $(this).attr("id"),
						i = "fch-det-" + r + "-" + (e + 1) + "-" + s;
					o.find("tbody").find("tr").eq(a).find("#" + n).attr({
						id: i
					})
				})
			}
		}
		setInterval(function() {
			(h = 0 == h ? 1 : h) % 10 == 0 && ($(".wrap-slider-right").trigger("mouseenter"), $(".btn-slider-right").trigger("click")), h++
		}, 1e3), $(".cbo-list").on("change", function() {
			$(".cbo-list option:selected").each(function() {
				var e = $(this).attr("data-url");
				"" != e && $(".go-select").attr("href", e)
			})
		}), $("#cbo-perfil").on("change", function() {
			$("#cbo-perfil option:selected").each(function() {
				var e = $(this).text();
				"Especialista" == e || "ESPECIALISTA MRV" == e ? $(".medidas-especialista").show() : $(".medidas-especialista").hide()
			})
		}), $("#aceptar-terminos-condiciones").on("click", function() {
			$("#chk-terminos-condiciones").trigger("click"), $("#terminos-condiciones").modal("hide")
		}), $(".txt-file-control").on("click", function() {
			$(this).next().trigger("click")
		}), $(".fil-file-control").on("change", function() {
			var e = $(this).val().split("\\"),
				t = e.length;
			$(this).prev().val(e[t - 1])
		}), $(document).on("click", ".agregarCampos", function(e) {
			e.preventDefault();
			debugger;
            var t = $(this),
				n = t.parent().parent().parent().parent().parent().parent(),
				i = t.parent().parent().parent().parent().parent(),
				o = t.parent().parent().parent().parent().clone().html(),
				r = i.find("th").length + 1;
			i.append("<tr id='detalles-tr-" + r + "'>" + o + "</tr>"), $(".dropdown-menu").removeClass("show"), m(n)
		}), $(document).on("click", ".quitarCampos", function(e) {
			e.preventDefault();
			var t = $(this);
			t.parent().parent().parent().parent().remove();
			var n = t.parent().parent().parent().parent().parent().parent();
			$(".dropdown-menu").removeClass("show"), m(n)
		});
		var g = document.getElementById("columnas-detalle") ? document.getElementById("columnas-detalle") : "";

		function v() {
		    var e = $("#columnas-enfoque").find(".list-group-item"),
                a = "";
				i = "";
			e.each(function (e, t) {
			    debugger;
			    var n = $(this).attr("data-value");
			    a += n + '|', $("#txa-enfoque").data("r", a);
				i += n, $("#txa-enfoque").val(i)
			})
		}
		"" != g && new Sortable(g, {
			animation: 150,
			ghostClass: "blue-background-class"
		}), $("input[name='rad-controles']").on("click", function() {
			var e = $(this),
				t = $("#cbo-campo");
			"cbo" == e.val() ? t.empty().html('<option value="1">Lista de equipos</option><option value="2">Lista de autos</option><option value="3">Lista de indicadores</option><option value="4">Lista de marcas</option>') : "txt" == e.val() ? t.empty().html('<option value="5">Texto KRV</option><option value="6">Texto unidad</option><option value="7">Texto cantidad</option><option value="8">Texto subtotal</option>') : t.empty().html('<option value="9">Campo de fecha</option>')
		}), $("#cbo-grupo").on("change", function() {
			$("#cbo-grupo option:selected").each(function() {
				var e = $(this),
					t = e.attr("class");
				e.parent().removeClass().addClass("form-control").addClass(t)
			})
		}), $("#add-columna-detalle").on("click", function(e) {
			e.preventDefault();
			var t = $("#columnas-detalle"),
				n = $("input[name='rad-controles']:checked").val(),
				i = $("#cbo-campo option:selected").text(),
				o = $("#cbo-campo option:selected").val(),
				r = $("#cbo-grupo option:selected").attr("class"),
				a = $("#cbo-grupo option:selected").val(),
				s = "mrv_" + Math.random().toString(36).substr(2, 9);
			t.append('<div class="list-group-item sortable-item ' + r + '" id="' + s + '" data-enfoque="" data-resutado=""><i class="fas fa-2x fa-arrows-alt"></i><small>' + i + '</small><input type="hidden" class="hidden-control field-ctrol" value="' + n + '"><input type="hidden" class="hidden-control field-campo" value="' + o + '"><input type="hidden" class="hidden-control field-grupo" value="' + a + '"><i class="fas fa-minus-circle cursor-pointer mr-2 mt-2 delete-columna-detalle" data-toggle="tooltip" data-placement="top" title="Eliminar columna"></i><i class="fas fa-square-root-alt cursor-pointer ml-2 mt-2 enfoque-columna-detalle" data-toggle="tooltip" data-placement="top" title="Añadir fórmula"></i></div>'), $('[data-toggle="tooltip"]').tooltip()
		});
		var y = document.getElementById("columnas-enfoque") ? document.getElementById("columnas-enfoque") : "";
		if ("" != y && new Sortable(y, {
				animation: 150,
				ghostClass: "blue-background-class",
				onSort: function(e) {
					v()
				},
				onRemove: function(e) {}
			}), $("#cbo-parametros").on("change", function() {
				$("#cbo-parametros option:selected").each(function() {
					var e = $(this).val();
					e = "[" + e + "]", $("#add-parametro").attr({
						"data-value": e
					})
				})
			}), $("#add-parametro").on("click", function(e) {
				e.preventDefault();
                debugger;
                var t = $(this).attr("data-value"),
					n = $("#columnas-enfoque");
				"[0]" != t && (n.append('<div class="list-group-item sortable-item" data-value="' + t + '"><i class="fas fa-2x fa-arrows-alt"></i><small class="badge badge-primary">' + t + '</small><i class="fas fa-minus-circle cursor-pointer delete-columna-detalle" data-toggle="tooltip" data-placement="top" title="Eliminar" data-enfoque="1"></i></div>'), $('[data-toggle="tooltip"]').tooltip()), v()
			}), $("#txt-constante").on("keyup", function() {
				var e = $(this).val();
				e = "[C" + e + "]", $("#add-constante").attr({
					"data-value": e
				})
			}), $("#add-constante").on("click", function(e) {
				e.preventDefault();
				var t = $(this).attr("data-value"),
					n = $("#columnas-enfoque");
				"[C0]" != t && "" != t && (n.append('<div class="list-group-item sortable-item" data-value="' + t + '"><i class="fas fa-2x fa-arrows-alt"></i><small class="badge badge-warning">' + t + '</small><i class="fas fa-minus-circle cursor-pointer delete-columna-detalle" data-toggle="tooltip" data-placement="top" title="Eliminar" data-enfoque="1"></i></div>'), $('[data-toggle="tooltip"]').tooltip()), v()
			}), $("#cbo-factores").on("change", function() {
				$("#cbo-factores option:selected").each(function() {
					var e = $(this).val();
					e = "[" + e + "]", $("#add-factor").attr({
						"data-value": e
					})
				})
			}), $("#add-factor").on("click", function(e) {
				e.preventDefault();
				var t = $(this).attr("data-value"),
					n = $("#columnas-enfoque");
				"[0]" != t && (n.append('<div class="list-group-item sortable-item" data-value="' + t + '"><i class="fas fa-2x fa-arrows-alt"></i><small class="badge badge-info">' + t + '</small><i class="fas fa-minus-circle cursor-pointer delete-columna-detalle" data-toggle="tooltip" data-placement="top" title="Eliminar" data-enfoque="1"></i></div>'), $('[data-toggle="tooltip"]').tooltip()), v()
			}), $(".gpo-operador").on("click", function(e) {
				e.preventDefault();
				var t = $(this).attr("data-value");
				$("#add-operador").attr({
					"data-value": t
				})
			}), $("#add-operador").on("click", function(e) {
				e.preventDefault();
				var t = $(this).attr("data-value"),
					n = $("#columnas-enfoque");
				"0" != t && (n.append('<div class="list-group-item sortable-item" data-value="' + t + '"><i class="fas fa-2x fa-arrows-alt"></i><small class="badge badge-secondary">' + t + '</small><i class="fas fa-minus-circle cursor-pointer delete-columna-detalle" data-toggle="tooltip" data-placement="top" title="Eliminar" data-enfoque="1"></i></div>'), $('[data-toggle="tooltip"]').tooltip()), v()
			}), $(document).on("click", ".delete-columna-detalle", function(e) {
				var t = $(this),
					n = t.attr("data-enfoque");
				t.parent().remove(), $(".tooltip").remove(), "1" == n && v()
			}), $(document).on("click", ".enfoque-columna-detalle", function(e) {
				var t = $(this),
					n = t.parent().attr("data-enfoque"),
					i = t.parent().attr("id");
				if ($("#columnas-enfoque").empty(), $("#txa-enfoque").val(""), $(".composicion").removeClass("d-none"), $("#guardar-enfoque").attr({
						"data-field": i
					}), "1" == n) {
                    debugger;
                    var o = sessionStorage.getItem(i).split(",");
					$("#columnas-enfoque").empty().html(o[0]), $("#txa-enfoque").val(o[1])
				}
			}), $("#guardar-enfoque").on("click", function(e) {
				e.preventDefault();
                debugger;
				var t = $(this).attr("data-field"),
					n = $("#columnas-enfoque").eq(0).html(),
                    a = $("#txa-enfoque").data("r"),
					i = $("#txa-enfoque").val();
				console.log(n), $("#" + t).attr({
					"data-enfoque": "1"
				}), $("#" + t).attr({
					"data-resultado": i
		        }), $("#" + t).attr({
					"data-resultadobd": a
		        }), $("#" + t).addClass("enfoque-add"), $("#" + t).find(".enfoque-columna-detalle").addClass("text-indigo");
				var o = [n, i];
				sessionStorage.setItem(t, o), $(".composicion").addClass("d-none"), $("#cbo-parametros option").prop("selected", function() {
					return this.defaultSelected
				}), $("#txt-constante").val(""), $("#cbo-factores option").prop("selected", function() {
					return this.defaultSelected
				}), $("#add-parametro").attr({
					"data-value": "[0]"
				}), $("#add-constante").attr({
					"data-value": "[0]"
				}), $("#add-factor").attr({
					"data-value": "[0]"
				}), $("#add-operador").attr({
					"data-value": "0"
				})
			}), $("#cancelar-enfoque").on("click", function(e) {
				$(".composicion").addClass("d-none")
			}), 0 < $(".main-timeline7").length) {
			var b = $(".timeline").length;
			b % 2 == 0 && 2 < b ? $(".timeline:last-child").attr("style", "margin-top: 0px !important") : 2 == b ? $(".timeline:last-child").attr("style", "margin-top: 140px !important") : 1 == b && $(".timeline:last-child").attr("style", "margin-top: 0px !important")
		}

		function w(e, t) {
			var n, i = e.val().length,
				o = e.attr("id"),
				r = $(".spanNivelesColores");
			t.stopPropagation(), (n = $(".error")).hasClass("oculto") || n.addClass("oculto"), "txt-pswd" === o && (0 < i && i < 6 ? (nivel = "Bajo", r.removeClass().addClass("spanNivelesColores bajo")) : 6 <= i && i < 10 ? (nivel = "Medio", r.removeClass().addClass("spanNivelesColores medio")) : 10 <= i && i < 14 ? (nivel = "Alto", r.removeClass().addClass("spanNivelesColores alto")) : 14 <= i && (nivel = "Muy alto", r.removeClass().addClass("spanNivelesColores muyAlto")), 0 === i && r.removeClass().addClass("spanNivelesColores"))
		}
		$("input[name='rad-medidas']").on("click", function() {
			var e = $(this).val();
			"new" == e ? ($("#field-" + e).removeClass("d-none"), $("#field-xst").addClass("d-none")) : ($("#field-" + e).removeClass("d-none"), $("#field-new").addClass("d-none"))
		}), $("input[name='rad-comunicacion']").on("click", function() {
			"tel" == $(this).val() ? ($(".tel").removeClass("d-none"), $(".cel").addClass("d-none")) : ($(".cel").removeClass("d-none"), $(".tel").addClass("d-none"))
		}), $("#filtro-estado .dropdown-item").on("click", function(e) {
			e.preventDefault();
			var t = $(this),
				n = t.html();
			t.parent().prev().html(n)
		}), new WOW({
			boxClass: "wow",
			animateClass: "animated",
			offset: 0,
			mobile: !0,
			live: !0,
			callback: function(e) {},
			scrollContainer: null
		}).init(), $("#txt-pswd").on("keyup", function(e) {
			var t = $("#nivelseguridad");
			w($(this), e), t.html(nivel)
		}), $(".ver-clave").on("click", function(e) {
			var t = $(this),
				n = t.parent().prev();
			"password" == n.attr("type") ? (n.attr({
				type: "text"
			}), t.empty().html('<i class="fas fa-eye-slash mr-1"></i> Ocultar')) : (n.attr({
				type: "password"
			}), t.empty().html('<i class="fas fa-eye mr-1"></i> Mostrar'))
		}), $("#formRegistrar #cbo-sector").on("change", function() {
			$("#formRegistrar #cbo-sector option:selected").each(function() {
				"SECTOR PRIVADO" == $(this).text() ? $(".dj").removeClass("d-none") : $(".dj").addClass("d-none")
			})
		}), $("#btn-modal-consultar").on("click", function() {
			$("#modal-usuario").modal("hide"), setTimeout(function() {
				$("#modal-consulta").modal("show")
			}, 350)
		}), $("#btn-modal-usuario").on("click", function() {
			$("#modal-consulta").modal("hide"), setTimeout(function() {
				$("#modal-usuario").modal("show")
			}, 350)
		}), "undefined" != typeof primerIngreso && 1 == primerIngreso ? ($("#modal-bienbenida").modal("show"), $("#modal-bienbenida").on("hidden.bs.modal", function(e) {
			$(".primerIngreso").addClass("d-none")
		})) : $(".primerIngreso").addClass("d-none"), $(document).on("click", ".txt-placas", function() {
			$("#registrar-placas").modal("show"), sessionStorage.setItem("cantidadPlacas", $(this).attr("id"))
		}), $('[data-role="tagsinput"]').on("change", function(e) {
			var t = $(e.target);
			if (t.data("tagsinput")) {
				var n = t.val();
				null === n && (n = "null");
				var i = n.split(",").length;
				$(".btn-afirmar-placas").empty().html("Guardar <b>" + i + "</b> placa(s)"), $(".btn-afirmar-placas").attr({
					"data-placas": i
				})
			}
		}).trigger("change"), $(".btn-afirmar-placas").on("click", function() {
			var e = sessionStorage.getItem("cantidadPlacas");
			$("#" + e).val($(".btn-afirmar-placas").attr("data-placas")), $("#registrar-placas").modal("hide")
		})
	});